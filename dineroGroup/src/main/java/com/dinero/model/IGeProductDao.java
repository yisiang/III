package com.dinero.model;

import java.util.List;

public interface IGeProductDao {

	GeProductBean insert(GeProductBean productBean);

	List<GeProductBean> selectAll();

	GeProductBean selectById(int id);

	boolean delete(int id);
	
	public GeProductBean updateProdStock(int prodId, int stock ,int qty);
	
	public int getProdStock(int id);
	
	public List<String> selectAllDistinctProdName();
	
	public List<String> selectAllDistinctProdType();
}