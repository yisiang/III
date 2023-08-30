package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface RoleRepository extends JpaRepository<Role, Integer> {

//	@Query("SELECT Role r where r.name = ?1")
	public Role findByName(String name);
	
	List<Role> findByRoleId(Integer roleId);
}
