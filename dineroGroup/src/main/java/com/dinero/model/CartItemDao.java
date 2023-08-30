package com.dinero.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CartItemDao implements ICartItemDao {
	
	@Autowired
	EntityManager entityManager;
	
	public CartItemDao() {}
	
	@Override
	public CartItemBean insert(CartItemBean item) {
		
		Session session = entityManager.unwrap(Session.class);
		session.save(item);
		session.close();
		return item;
	}
	
	@Override
	public List<CartItemBean> selectByCartId(int id) {
		Session session = entityManager.unwrap(Session.class);
		String queryString = "select i from CartItemBean i where i.cart.cartId = :cartId";
		Query<CartItemBean> query = session.createQuery(queryString,CartItemBean.class);
		query.setParameter("cartId", id);
		List<CartItemBean> list = query.list();
		
		session.close();
		return list	;
		
	}
	
	public List<CartItemBean> findAll(){
		Session session = entityManager.unwrap(Session.class);
		String queryString = "select i from CartItemBean i ";
		Query<CartItemBean> query = session.createQuery(queryString,CartItemBean.class);
		List<CartItemBean> list = query.list();
		
		session.close();
		return list	;
	}
}
