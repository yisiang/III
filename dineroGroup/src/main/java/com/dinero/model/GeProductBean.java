package com.dinero.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity @Table(name = "Product")
public class GeProductBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prodId;
	@Basic
	private int stock;
	@Basic
	private int price;
	@Basic
	private String prodName;
	@Basic
	private String descript;
	@Basic
	private String category;
	@Basic
	private String petkind;
	
	@Column(name="PRODIMG")
	private String prodImg;
	
	
	@OneToMany (mappedBy = "product" ,cascade = CascadeType.ALL ,fetch = FetchType.LAZY) 
	private Set<CartItemBean> items = new HashSet<CartItemBean>();
	
	public GeProductBean() {
		
	}
	
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getPetkind() {
		return petkind;
	}
	public void setPetkind(String petkind) {
		this.petkind = petkind;
	}

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}
	
	
}
