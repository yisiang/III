package com.dinero.model;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public interface IUserService {
	public Boolean findByUsername(String string);
	public User findUserByUsername(String string);
	public User insertUser(User user);
	public void insertAdmin(User user);	
	public void saveRole(Role role);
	public void addRoleToUser(String username,String roleName);
	public User getUser(String username);
	public  Optional<User> selectUser(int UserID);
	public List<User> selectAllUser();
	public void deleteUser(int UserID);
	User updateUser(User user );
	List<Role> getRoles();
	User getUser(Integer id);
	public Boolean findByEmail(String email);
	public User findUserByEmail(String email);
	public void sendVerificationEmail(User user);
	public void sendVerificationEmail(User user, String siteURL) throws UnsupportedEncodingException, MessagingException;
	public boolean verify(String verificationCode);
	void updateResetPassword(String token, String email) throws UserNotFoundException;
	User get(String restPasswordToken);
	void updatePassword(User user, String newPassword);
	public void sendForgetPasswordEmail(String email, String resetPasswordLink) throws UnsupportedEncodingException, MessagingException ;
	public User createNewUserAfterOAuthLoginSuccess(String email, String name, AuthenticationProvider provider);
	
	public String findUserNameById(int id);
}