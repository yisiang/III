package com.dinero.model;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity @Table(name = "productBase64")
public class ProductBase64Bean {
	@Id
	private int prodId;
	
	@Basic
	private String prodName;
	
	@Basic
	private String answer;
}
