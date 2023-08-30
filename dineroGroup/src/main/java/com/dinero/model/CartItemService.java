package com.dinero.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CartItemService implements ICartItemService {
	
	@Autowired
	private ICartItemDao dao;
	
	
	
	@Override
	public CartItemBean insert(CartItemBean cart) {
		return this.dao.insert(cart);
	}
	
	@Override
	public List<CartItemBean> selectByCartId(int id){
		return this.dao.selectByCartId(id);
	}

	@Override
	public List<CartItemBean> findAll() {
		
		return this.dao.findAll();
	}
	
	
}
