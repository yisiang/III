package com.dinero.model;

import java.util.List;

public interface ICartItemService {

	CartItemBean insert(CartItemBean cart);

	List<CartItemBean> selectByCartId(int id);
	
	public List<CartItemBean> findAll();
}