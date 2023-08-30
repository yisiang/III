package com.dinero.model;

import java.util.List;

import javax.swing.undo.AbstractUndoableEdit;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class GeProductService implements IGeProductService {
	
	@Autowired
	IGeProductDao dao ;
	
	
	@Override
	public GeProductBean insert(GeProductBean productBean) {
		
		return dao.insert(productBean);
	}

	@Override
	public List<GeProductBean> selectAll() {
		
		return dao.selectAll();
	}

	@Override
	public GeProductBean selectById(int id) {
		
		return dao.selectById(id);
	}

	@Override
	public boolean delete(int id) {
		
		return dao.delete(id);
	}
	
	public GeProductBean updateProdStock(int prodId, int stock ,int qty) {
		return dao.updateProdStock(prodId, stock, qty);
	}
	
	public int getProdStock(int id) {
		return dao.getProdStock(id);
	}
	
	//after adding coupon
	
	public List<String> selectAllDistinctProdName(){
		return dao.selectAllDistinctProdName();
	}
	
	public List<String> selectAllDistinctProdType(){
		return dao.selectAllDistinctProdType();
	}
	
	
}
