package com.dinero.model;


import java.util.LinkedList;
import java.util.List;

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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="coupon")
public class CouponBean {
	
	//form 不用給
	@Id @Column(name = "coupon_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int couponId;
	
	@Column(name = "coupon_name" , columnDefinition = "nvarcahr(50)")
	@NotNull(message = "請輸入名稱")
	private String couponName;
	
	@Column(name = "discount_type")
	@Enumerated(EnumType.STRING)
	private DiscountType discountType;
	
	@Column(name = "discounted_class")
	private String discountedClass;
	
	@Column(name = "discount_value")
	@NotNull(message = "is required")
	private Integer discountValue;
	
	@Column(name = "discount_unit")
	@NotNull(message = "is required")
	private String discountUnit;
	
	//form 不用給
	@Column(name = "create_date")
	private String createDate;
	
	@Column(name = "valid_from")
	@NotNull(message = "is required")
	@Pattern(regexp = "[0-9]{1,4}/[0-9]{1,2}/[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}",message = "YYYY/MM/DD HH:MI:SS")
	private String validFrom;
	
	@Column(name="valid_until")
	@NotNull(message = "is required")
	@Pattern(regexp = "[0-9]{1,4}/[0-9]{1,2}/[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}",message = "YYYY/MM/DD HH:MI:SS")
	private String validUntil;
	
	@Column(name="coupon_code")
	@NotNull(message = "is required")
	private String couponCode;
	
	@Column(name="concurrency")
	@NotNull(message = "is required")
	private boolean concurrency;
	
	@Column(name="minimum_order_value")
	private Integer minimumOrderValue;
	
	@Column(name="maximum_discount_amount")
	private Integer maximumDiscountAmount;
	
	@Column(name = "describe" , columnDefinition = "nvarchar(150)")
	private String describe;
	
	//多對多
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.REMOVE})
	@JoinTable(name = "cart_coupon",joinColumns = @JoinColumn(name="coupon_id"),inverseJoinColumns = @JoinColumn(name="cart_id"))
	@JsonIgnore
	private List<CartBean> carts;
	
	public void addcart(CartBean cart) {
		if(carts == null) {
			carts = new LinkedList<CartBean>();
		}
		carts.add(cart);
	}
	
	public List<CartBean> getCarts() {
		return carts;
	}

	public void setCarts(List<CartBean> carts) {
		this.carts = carts;
	}

	//以上為多對多
	public int getCouponId() {
		return couponId;
	}

	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}

	public DiscountType getDiscountType() {
		return discountType;
	}

	public void setDiscountType(DiscountType discountTyep) {
		this.discountType = discountTyep;
	}

	public String getDiscountedId() {
		return discountedClass;
	}

	public void setDiscountedId(String discountedId) {
		this.discountedClass = discountedId;
	}

	public String getDiscountUnit() {
		return discountUnit;
	}

	public void setDiscountUnit(String dicountUnit) {
		this.discountUnit = dicountUnit;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String dateCreated) {
		this.createDate = dateCreated;
	}

	public String getValidFrom() {
		return validFrom;
	}

	public void setValidFrom(String validFrom) {
		this.validFrom = validFrom;
	}

	public String getValidUntil() {
		return validUntil;
	}

	public void setValidUntil(String validUntil) {
		this.validUntil = validUntil;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public Integer getMinimumOrderValue() {
		return minimumOrderValue;
	}

	public void setMinimumOrderValue(Integer minimumOrderValue) {
		this.minimumOrderValue = minimumOrderValue;
	}

	public Integer getMaximumDiscountAmount() {
		return maximumDiscountAmount;
	}

	public void setMaximumDiscountAmount(Integer maximumDiscountAmount) {
		this.maximumDiscountAmount = maximumDiscountAmount;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getDiscountedClass() {
		return discountedClass;
	}

	public void setDiscountedClass(String discountedClass) {
		this.discountedClass = discountedClass;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Integer getDiscountValue() {
		return discountValue;
	}

	public void setDiscountValue(Integer discountValue) {
		this.discountValue = discountValue;
	}

	public boolean isConcurrency() {
		return concurrency;
	}

	public void setConcurrency(boolean concurrency) {
		this.concurrency = concurrency;
	}
	
	
	
}
