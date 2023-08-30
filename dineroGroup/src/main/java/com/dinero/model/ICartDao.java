package com.dinero.model;

import java.util.List;

public interface ICartDao {
	CartBean insert(CartBean cBean);

	CartBean selectByid(int id);

	List<CartBean> selectAll();

	CartBean updateStatus(int id, OrderStatus status);

	boolean delete(int id);

	CartBean updateShipment(int id);

	List<CartBean> advancedSelect(String cartIdParam, String custIdParam, String minStr, String maxStr,
			String minDateStr, String maxDateStr);

	List<CartBean> selectOrdByCustId(int custId);

	CartBean selectByCartId(int cartId);

	List<CartBean> selectByDate(String minDate, String maxDate);

	List<CartBean> selectByTotal(String minStr, String maxStr);
	
	void makeRefund(int cartId);
	
	void acceptRefund(int cartId);
	
	void rejectRefund(int cartId);
	
	void shipOrd(int cartId);
}
