package com.dinero.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name = "product")
@Component
public class Product {
	
		@Id @Column(name = "PRODID")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int prodId;
		
		@Column(name = "STOCK")
		private int stock;
		
		@Column(name = "PRICE")
		private int price;
		
		@Column(name = "PRODNAME")
		private String prodName;
		
		@Column(name = "DESCRIPT")
		private String descript;
		
		@Column(name = "CATEGORY")
		private String category;
		
		@Column(name = "PETKIND")
		private String petkind;
		
		@Column(name="PRODIMG")
		private String prodImg;
		
		@OneToOne(mappedBy = "product" , fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JsonIgnore
		private ProductDetail productDetail;
		
		@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST ,CascadeType.MERGE,
				CascadeType.DETACH,CascadeType.REFRESH})
		@JoinTable(name="productlike", 
				   joinColumns = {@JoinColumn(name = "PRODID")},
				   inverseJoinColumns = {@JoinColumn(name="USERID")}
				   )
		private Set<User> users = new HashSet<User>();
		
		public Set<User> getUsers() {
			return users;
		}
		
		public void setUsers(Set<User> users) {
			this.users = users;
		}
		
		public ProductDetail getProductDetail() {
			return productDetail;
		}

		public void setProductDetail(ProductDetail productDetail) {
			this.productDetail = productDetail;
		}
		
		public int getProdId() {
			return prodId;
		}

		public void setProdId(int prodId) {
			this.prodId = prodId;
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

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
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
