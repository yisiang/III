package com.dinero.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name = "Cart")
public class CartBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id @Column(name = "cartId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartId;
	
	@Column(name = "custId")
	private int custId;

	@Column(name = "total")
	private int cartTotal;
	
	@Column(name = "tradeDate") 
	private String tradeDate;
	
	@Column(name = "orderStatus")
	@Enumerated(EnumType.STRING)
	private OrderStatus orderState;
	
	@Column(name="shipmentDate")
	private String shipmentDate;
	
	@OneToMany(fetch = FetchType.EAGER , mappedBy = "cart",cascade = CascadeType.ALL , orphanRemoval = true)
	private List<CartItemBean> items = new ArrayList<>();
	
	//新增優惠券功能 多對多
	@ManyToMany(fetch = FetchType.LAZY
			,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
	@JoinTable(name = "cart_coupon",joinColumns = @JoinColumn(name="cart_id"),inverseJoinColumns = @JoinColumn(name="coupon_id"))
	@JsonIgnore
	private List<CouponBean> coupons;
	
	public void addCoupon(CouponBean coupon) {
		
		if(coupons == null) {
			coupons = new LinkedList<CouponBean>();
		}
		
		coupons.add(coupon);
		
	}
	
	public List<CouponBean> getCoupons() {
		return coupons;
	}

	public void setCoupons(List<CouponBean> coupons) {
		this.coupons = coupons;
	}
	
	//以上是優惠券
	
	@Override
	public String toString() {
		
		return "cartId "+cartId + " custId "+custId+" cartTotal "+cartTotal+" date"+tradeDate;
	}
	
	public void setCartTotal() {
		this.cartTotal =  this.items.stream().mapToInt(CartItemBean::getItemTotal).reduce(0,Integer::sum);
	}
	
	public void setCartTotal(int cartTotal) {
		this.cartTotal = cartTotal;
	}
	
	public void setOrderState() {
		if(this.orderState == null) {
			this.orderState = OrderStatus.Pending;
		}
	}
	
	public CartBean(int custId) {
		this.custId = custId;
	}
	
	
	public void addItem(CartItemBean item) {
		items.add(item);
	}
	
	public void setItemCartId() {
		items.stream().forEach(item->item.setCart(this));
	}
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public int getTotal() {
		return cartTotal;
	}

	public void setTotal(int total) {
		this.cartTotal = total;
	}

	public String getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}

	public List<CartItemBean> getItems() {
		return items;
	}

	public void setItems(List<CartItemBean> items) {
		this.items = items;
	}
	
	
	
	public OrderStatus getOrderState() {
		return orderState;
	}


	public void setOrderState(OrderStatus status) {
		this.orderState = status;
	}

	public String getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}
	
	
	
	public int getCartTotal() {
		return cartTotal;
	}

	public CartBean() {}
}
