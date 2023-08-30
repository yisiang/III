package com.dinero.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dinero.util.DateTransformer;


@Repository
@Transactional
public class CartDao implements ICartDao{
	
	@Autowired
	private EntityManager entityManager;
	
	public CartDao() {}
	
	
	@Override
	public CartBean insert(CartBean cBean) {
		
		
		Session session = entityManager.unwrap(Session.class);
		
		System.out.println("insert into cart");
		CartBean cFound = session.get(CartBean.class, cBean.getCartId());
		
		if( cFound == null) {
			cBean.getItems().forEach(System.out::println);
			session.save(cBean);
			//因目前不會存入
//			CartItemDao cartItemDao = new CartItemDao(session);
//			cBean.getItems().forEach( item -> cartItemDao.insert(item) );
			session.flush();
			session.close();
			return cBean;
		}
		session.close();
		return null;
	}

	@Override
	public CartBean selectByid(int id) {
		Session session = entityManager.unwrap(Session.class);
		session.close();
		return session.get(CartBean.class, id);
	}

	@Override
	public List<CartBean> selectAll() {
		Session session = entityManager.unwrap(Session.class);
		Query<CartBean> query = session.createQuery("select c  from CartBean c",CartBean.class);
		List<CartBean> list = query.list();
		session.close();
		return list;
	}

	@Override
	public CartBean updateStatus(int id, OrderStatus status) {
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, id);
		if(cartBean != null) {
			cartBean.setOrderState(status);
			session.update(cartBean);
			session.close();
			return cartBean;
		}
		session.close();
		return null;
	}

	@Override
	public boolean delete(int id) {
		Session session = entityManager.unwrap(Session.class);
		CartBean cart = session.get(CartBean.class, id);
		System.out.println(cart.getCartId());
		
		if(cart != null) {
			session.delete(cart);
			session.close();
			return true ; 
		}else {
			session.close();
			return false;
		}
		
		
		
	}

	@Override
	public CartBean updateShipment(int id) {
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, id);
		DateTransformer dtf = new DateTransformer();
		if(cartBean != null) {
			cartBean.setShipmentDate(dtf.newStringDate());
			session.update(cartBean);
			session.close();
			return cartBean;
		}
		session.close();
		return null;
		
	}
	
	@Override
	public List<CartBean> advancedSelect(String cartIdParam, String custIdParam
			, String minStr, String maxStr,String minDateStr ,String maxDateStr){
		List<CartBean> ords = selectAll();
		//cartId 搜尋
		List<CartBean> answer = ords.stream().filter(o -> {
			if (cartIdParam != null && cartIdParam != "") {
				return String.valueOf(o.getCartId()).equals(cartIdParam);
			} else {
				return true;
			}
		// custId 搜尋	
		}).filter(o -> {
			if (custIdParam != null && custIdParam != "") {
				int parseInt = Integer.parseInt(custIdParam);
				return o.getCustId() == parseInt;
			} else {
				return true;
			}
		// price 搜尋
		}).filter(o -> {
			int min;
			int max;
			if (minStr == null || minStr == "") {
				min = 0;
			} else {
				min = Integer.parseInt(minStr);
			}
			
			if (maxStr == null || maxStr == "") {
				max = Integer.MAX_VALUE;
			} else {
				max = Integer.parseInt(maxStr);
			}
			
			if(max < min) {
				int tmp = max;
				max = min;
				min = tmp;
			}
			
			return o.getCartTotal() >= min && o.getCartTotal() <= max;
		// date 搜尋
		}).filter(o->{
			String censoredMinDate;
			String censoredMaxDate;
			if (minDateStr == null || minDateStr == "") {
				censoredMinDate = "1996-11-30";
			}else {
				censoredMinDate = minDateStr;
			}
			
			if (maxDateStr == null || maxDateStr == "") {
				censoredMaxDate = "2056-11-30";
			} else {
				censoredMaxDate = maxDateStr;
			}
			DateTransformer dtf = new DateTransformer();
			Date minTimestamp = null;
			Date maxTimestamp = null;
			Timestamp ordTimeStamp = null;
			try {
				minTimestamp = dtf.strToJavaDate(censoredMinDate);
				maxTimestamp = dtf.strToJavaDate(censoredMaxDate);
				ordTimeStamp = dtf.sqlDateStrToCalendar(o.getTradeDate());
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			
			
			return ordTimeStamp.compareTo(minTimestamp) >= 0 && ordTimeStamp.compareTo(maxTimestamp) <= 0;
		}).collect(Collectors.toList());
		//.forEach(System.out::println);

		return answer;
	}
	
	@Override
	public List<CartBean> selectOrdByCustId(int custId){
		Session session = entityManager.unwrap(Session.class);
		String sql = "select c from CartBean c where c.custId = ?0";
		Query<CartBean> query = session.createQuery(sql,CartBean.class);
		query.setParameter(0, custId);
		List<CartBean> list = query.list();
		session.close();
		return  list;
	}
	
	@Override
	public CartBean selectByCartId(int cartId) {
		Session session = entityManager.unwrap(Session.class);
		String sql = "select c from CartBean c where c.cartId = ?0";
		Query<CartBean> query = session.createQuery(sql,CartBean.class);
		query.setParameter(0, cartId);
		CartBean uniqueResult = query.uniqueResult();
		session.close();
		return uniqueResult;
	}
	
	@Override
	public List<CartBean> selectByDate(String minDate,String maxDate){
		return null;
	}
	
	@Override
	public List<CartBean> selectByTotal(String minStr,String maxStr){
		Session session = entityManager.unwrap(Session.class);
		String sql = "select c from CartBean c where c.cartTotal BETWEEN ?0 AND ?1";
		Query<CartBean> query = session.createQuery(sql , CartBean.class);
		int min;
		int max;

		if (minStr == null || minStr == "") {
			minStr = "0";

		}

		if (maxStr == null || maxStr == "") {
			maxStr = "2147483646";

		}

		try {
			min = Integer.parseInt(minStr);
			if (min < 0) {
				min = 0;
			}
		} catch (NumberFormatException e) {
			min = 0;
		}

		try {
			max = Integer.parseInt(maxStr);
		} catch (NumberFormatException e) {
			max = 2147483646;
		}
		
		query.setParameter(0,min);
		query.setParameter(1, max);
		List<CartBean> list = query.list();
		session.close();
		return list;
	}
	
	//退費相關
	public void makeRefund(int cartId) {
		
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, cartId);
		cartBean.setOrderState(OrderStatus.Refunded);
		session.update(cartBean);
	}
	
	public void acceptRefund(int cartId) {
		
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, cartId);
		cartBean.setOrderState(OrderStatus.Cancelled);
		session.update(cartBean);
	}
	
	public void rejectRefund(int cartId) {
		
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, cartId);
		cartBean.setOrderState(OrderStatus.Refused);
		session.update(cartBean);
	}
	
	public void shipOrd(int cartId) {
		DateTransformer dtf = new DateTransformer();
		Session session = entityManager.unwrap(Session.class);
		CartBean cartBean = session.get(CartBean.class, cartId);
		cartBean.setOrderState(OrderStatus.Shipped);
		cartBean.setShipmentDate(dtf.newStringDate());
		session.update(cartBean);
	}
}
