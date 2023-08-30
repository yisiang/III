package com.dinero.model;

import java.util.List;

public interface ICartItemDao {

	CartItemBean insert(CartItemBean item);

	List<CartItemBean> selectByCartId(int id);
	
	public List<CartItemBean> findAll();
}