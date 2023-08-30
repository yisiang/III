package com.dinero.model;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface UserRepository  extends JpaRepository<User, Integer>{

	
	@Query(value = "delete from User where id = ?1 ")
	@Modifying
	public void deleteUser(int userID);

	
	@Query("SELECT u FROM User u WHERE u.username = :username")
	public User findByUsername(@Param("username") String username);
	
	public User findUserByUsername(String username);

	public User findUserByEmail(String email);
	
	@Query("UPDATE User u SET u.enabled = 1 WHERE u.id = ?1")
	@Modifying
	public void enable(int id);
	
	@Query("SELECT u FROM User u WHERE u.verificationCode= ?1")
	public User findByVerificationCode(String verificationCode);
	
	
	public User findByResetPasswordToken(String token);
	
	
}
