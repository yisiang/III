package com.dinero.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ProductBase64Dao {

	@Autowired
	EntityManager entityManager;
	
	
	public ProductBase64Bean insert(ProductBase64Bean productBase64Bean) {
		
		Session session = entityManager.unwrap(Session.class);
		ProductBase64Bean sixFound = session.get(ProductBase64Bean.class,productBase64Bean.getProdId());
		
		if(sixFound == null) {
			session.save(productBase64Bean);
			session.close();
			return productBase64Bean;
		}
		
		session.close();
		return null;
		
	}
	
	public boolean delete(int prodId) {
		Session session = entityManager.unwrap(Session.class);
		
		ProductBase64Bean sixFound = session.get(ProductBase64Bean.class,prodId);
		
		if(sixFound != null) {
			session.delete(sixFound);
			session.close();
			return true;
		}
		
		session.close();
		return false;
		
	}
	
	public String selectPicById(int prodId) {
		Session session = entityManager.unwrap(Session.class);
		
		String sql = "select six.answer from ProductBase64Bean six where six.prodId = :xxx ";
		Query<String> query = session.createQuery(sql,String.class);
		query.setParameter("xxx", prodId);
		String result = query.uniqueResult();
		
		session.close();
		return result;
	}
	
	private class ProductBase64Bean{
		private int prodId;
		private String prodName;
		private String answer;
		public int getProdId() {
			return prodId;
		}
		public void setProdId(int prodId) {
			this.prodId = prodId;
		}
		public String getProdName() {
			return prodName;
		}
		public void setProdName(String prodName) {
			this.prodName = prodName;
		}
		public String getAnswer() {
			return answer;
		}
		public void setAnswer(String answer) {
			this.answer = answer;
		}
		
		
	}
}


