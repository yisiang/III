package com.dinero.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="productsale")
public class ProductDetail implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@GenericGenerator(name="generator", strategy = "foreign", parameters = @org.hibernate.annotations.Parameter(name="property", value="product"))
	@Id @Column(name="PRODID")
	@GeneratedValue(generator = "generator")
	private int prodId;
	

	@OneToOne( fetch = FetchType.LAZY)//mappedBy = "productDetail" , //, cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Product product;
	
	@Column(name="sales")
	private int sales;

	
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}


	
	

}
