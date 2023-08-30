package com.dinero.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {
	
	@Id
	@Column(name = "ROLEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roleId;
	private String name;
	
	
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//???? 這行真的神
	@Override
	public String toString() {
		return this.name;
	}
	
	public Role(Integer roleId, String name) {
		super();
		this.roleId = roleId;
		this.name = name;
	}
	
	
	public Role() {
		
	}
	

	
}
