package com.dinero.model;


import java.beans.Transient;
import java.util.ArrayList;
import java.util.HashSet;
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
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;




@Entity @Table(name = "users") 
public class User{
	
	@Id @Column(name = "USERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId ;
	private String username;
	private String password;
	private String name;
	private String email;
	private String address;
	private boolean enabled;
	
	@ManyToMany(fetch = FetchType.EAGER,
			cascade = {CascadeType.PERSIST ,CascadeType.MERGE,
					CascadeType.DETACH,CascadeType.REFRESH} )
	@JoinTable(name = "response_users",
			joinColumns = @JoinColumn(name="users_id"),
			inverseJoinColumns = @JoinColumn(name="response_id"))
	@JsonIgnore
	private List<ResponseBean> responses;
	
	
	public void addResponses(ResponseBean theResponse) {
		
		if(responses == null) {
			responses = new ArrayList<ResponseBean>();
		}
		
		responses.add(theResponse);
	}
	
	
	public List<ResponseBean> getResponses() {
		return responses;
	}


	public void setResponses(List<ResponseBean> responses) {
		this.responses = responses;
	}


	@Column(name = "verification_code" , updatable = false)
	private String verificationCode;
	
	@Column(name = "reset_password_token")
	private String resetPasswordToken;

	@Enumerated(EnumType.STRING)
	@Column(name = "auth_provider")
	private AuthenticationProvider authenticationProvider;
	
	
	@Column (nullable =  true, length = 255)
	private String photo;
	
	
	@ManyToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinTable(
			name = "users_roles",
			joinColumns = @JoinColumn(name = "USERID"),
			inverseJoinColumns = @JoinColumn(name ="ROLEID")
			)
	private Set<Role> roles = new HashSet<>();

	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST ,CascadeType.MERGE,
			CascadeType.DETACH,CascadeType.REFRESH})
	@JoinTable(name="productlike",
				joinColumns = {@JoinColumn(name="USERID")},
				inverseJoinColumns = {@JoinColumn(name="PRODID")}
				)
	private Set<Product> productlike = new HashSet<Product>();


	public Set<Product> getProductlike() {
		return productlike;
	}


	public void setProductlike(Set<Product> productlike) {
		this.productlike = productlike;
	}
	
	
	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Set<Role> getRoles() {
		return roles;
	}


	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	public void addRole (Role role) {
		this.roles.add(role);
	}
	
	public String getVerificationCode() {
		return verificationCode;
	}


	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	


	public AuthenticationProvider getAuthenticationProvider() {
		return authenticationProvider;
	}


	public void setAuthenticationProvider(AuthenticationProvider authenticationProvider) {
		this.authenticationProvider = authenticationProvider;
	}


	public User(Integer userId, String username, String password, String name, String email) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
	}


	public User(String username, String password, String name, String email) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	
	
	public User(String username, String password, String name, String email , Set<Role> roles , String photo) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.photo = photo;
		this.roles=roles;
	}
	
	public User(Integer userId, String username, String password, String name, String email , Set<Role> roles ,String photo) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.photo = photo;
		this.roles=roles;
	}
	
	public User(Integer userId, String username, String password, String name, String email, String address,
			String photo, Set<Role> roles) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.photo = photo;
		this.roles = roles;
	}
	
	
	public User() {
		
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Transient
	public String getPhotoImagePath() {
		if( photo == null || userId ==null) {
			return "/dinero/users-photo/null.jpg" ;
		}
		
		return "/dinero/users-photo/" + userId + "/" +photo;
	}
	

//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return user.isEn;
//	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}


	public String getResetPasswordToken() {
		return resetPasswordToken;
	}


	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}
	

}
