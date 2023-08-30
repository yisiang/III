package com.dinero.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import net.bytebuddy.implementation.attribute.AnnotationAppender.Target.OnType;

@Entity @Table(name= "CartItem") 
//@IdClass(CartItemId.class)
public class CartItemBean implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	

	@Id
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name ="cartId")
	@JsonIgnore
	private CartBean cart;
	
	@Transient
	private int cartId;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "prodId")
	@JsonIgnore
	private GeProductBean product ;
	
	@Transient
	private int prodId;
	
	public GeProductBean getProduct() {
		return product;
	}

	public void setProduct(GeProductBean product) {
		this.product = product;
		this.prodId = product.getProdId();
	}
	
	public int getCartId() {
		return cartId;
	}

	public int getProdId() {
		return prodId;
	}


	@Column(name="price")
	private int price;
	@Column(name="qty")
	private int qty;
	@Column(name="itemTotal")
	private int itemTotal;

	@Override
	public String toString() {
		
		return  "cartId"+ cart.getCartId() + "prodIdId"+ product.getProdId() +" price " +price +" "+ "qty " +qty + " " + "ItemToal "+itemTotal;
	}
	
	//sum = p x q
	public void setItemTotal() {
			this.itemTotal = this.price*this.qty;
	}
	
	
	
	
	public CartItemBean() {}




	public CartBean getCart() {
		return cart;
	}


	public void setCart(CartBean cart) {
		this.cart = cart;
		this.cartId = cart.getCartId();
	}





	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public int getItemTotal() {
		return itemTotal;
	}


	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}
	
	

}
