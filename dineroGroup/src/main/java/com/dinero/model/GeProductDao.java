package com.dinero.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public class GeProductDao implements IGeProductDao {
	
	@Autowired
	EntityManager entityManager;
	
	
	@Override
	public GeProductBean insert(GeProductBean productBean) {
		
	
		Session session = entityManager.unwrap(Session.class);
		
		
		GeProductBean pFound = session.get(GeProductBean.class, productBean.getProdId());
		if(pFound == null) {
			session.save(productBean);
			session.close();
			return productBean;
		}
		session.close();
		return null;
	}
	
	@Override
	public List<GeProductBean> selectAll(){
		Session session = entityManager.unwrap(Session.class);
		
		String sql = "select p from GeProductBean p";
		Query<GeProductBean> query = session.createQuery(sql,GeProductBean.class);
		List<GeProductBean> list = query.list();
		session.close();
		return list;	
	}
	
	@Override
	public GeProductBean selectById(int id) {
		Session session = entityManager.unwrap(Session.class);
		
		GeProductBean pFound = session.get(GeProductBean.class, id);
		if(pFound != null) {
			session.close();
			return pFound;
		}
		
		session.close();
		return null;
	}
	
	@Override
	public boolean delete(int id) {
		Session session = entityManager.unwrap(Session.class);
		
		GeProductBean pFound = selectById(id);
		if(pFound != null) {
			session.delete(pFound);
			session.close();
			return true;
		}
		session.close();
		return false;
	}
	
	public int getProdStock(int id) {
		Session session = entityManager.unwrap(Session.class);
		
		String sql = "select p.stock from GeProductBean p where p.prodId = :xxx";

		Query<Integer> query = session.createQuery(sql,Integer.class);
		query.setParameter("xxx", id );
		Integer stock = query.uniqueResult();
		session.close();
		return stock;
		
	}
	
	public GeProductBean updateProdStock(int prodId, int stock ,int qty) {
		Session session = entityManager.unwrap(Session.class);
		
		GeProductBean product = session.get(GeProductBean.class, prodId);
		
		stock -= qty;
		product.setStock(stock);
		session.update(product);
		session.flush();
		
		session.close();
		return product;
		
	}
	
	//after adding coupon
	
	public List<String> selectAllDistinctProdName(){
		
		Session session = entityManager.unwrap(Session.class);
		String jpqlStr = "select distinct(p.prodName) from GeProductBean p";
		Query<String> query = session.createQuery(jpqlStr,String.class);
		List<String> names = query.list();
		return names;
		
	}
	
	public List<String> selectAllDistinctProdType(){
		
		Session session = entityManager.unwrap(Session.class);
		String jpqlStr = "select distinct(p.category) from GeProductBean p";
		Query<String> query = session.createQuery(jpqlStr,String.class);
		List<String> categories = query.list();
		return categories;
	}
}
