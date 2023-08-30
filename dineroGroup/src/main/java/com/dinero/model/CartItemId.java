package com.dinero.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CartItemId implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column(name = "cartId")
	private int cartId;
	@Column(name = "prodId")
	private int prodId;
	
	public CartItemId (int cartId,int prodId) {
		this.cartId = cartId;
		this.prodId = prodId;
	}
	
	//override equals and hashcode
	
	
	
	@Override
	public boolean equals(Object obj) {
		if(this == obj ) 
			return true;
		if(!(obj instanceof CartItemId))
			return false;
		CartItemId that = (CartItemId)obj;
		return Objects.equals(getCartId(), that.getCartId()) &&
			   Objects.equals(getProdId(), that.getProdId());	
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return Objects.hash(getCartId(),getProdId());
	}

	public int getCartId() {
		return cartId;
	}

	public int getProdId() {
		return prodId;
	}
}
