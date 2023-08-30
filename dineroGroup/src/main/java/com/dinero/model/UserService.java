package com.dinero.model;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.bytebuddy.utility.RandomString;
@Service
@Transactional
public class UserService implements IUserService {

@Autowired	
private UserRepository uRepo;
	
@Autowired
private RoleRepository rRepo;

@Autowired
private JavaMailSender mailSender;


//	public UserService(Session session) {
//		this.uDao = new UserDao(session);
//	}
	
	@Override
	public User insertUser(User user) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
//		user.setEnabled(false);
		
		String randomCode =  RandomString.make(64);
		user.setVerificationCode(randomCode);
		
		Role roleUser =  rRepo.findByName("MEMBER");
		user.addRole(roleUser);
		uRepo.save(user);
		sendVerificationEmail(user);
		return uRepo.save(user);
		
	}

	@Override
	public void sendVerificationEmail(User user , String siteURL) throws UnsupportedEncodingException, MessagingException {
		String subject = "請驗證您的信箱";
		String senderName = "Dinero" ;
		String mailContent = "<p> 親愛的" +user.getName() + ",</p>";
		mailContent += "<p>請點選連結以進行驗證</p>";
		
		String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();
		mailContent += "<h3><a href=\"" + verifyURL + "\">驗證</a></h3>";
		mailContent += "<p>第一組敬上 </p>" ;
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("eeit39suwa68@outlook.com" , senderName);
		helper.setTo(user.getEmail());
		helper.setSubject(subject);
		helper.setText(mailContent , true);
		
		mailSender.send(message);
		
	}
	
	@Override
	public void sendForgetPasswordEmail(String email, String resetPasswordLink) throws UnsupportedEncodingException, MessagingException {
		
		String senderName = "Dinero" ;

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("eeit39suwa68@outlook.com",senderName);
		helper.setTo(email);
		
		String subject = "請點此連結重設您的密碼" ;
		String content = "<p> 您好,</p>"
				+"<p>請點選此連結以重設密碼</p>"
				+"<p><b><a href=\"" + resetPasswordLink + "\">更改我的密碼</a></b></p>";
		
		helper.setSubject(subject);
		helper.setText(content,true);
		
		mailSender.send(message);

		
	}
	
	
	


	@Override
	public void insertAdmin(User user) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setEnabled(true);
		
		Role roleUser =  rRepo.findByName("MEMBER");
		user.addRole(roleUser);
		uRepo.save(user);
	}
	
	@Override
	public Optional<User> selectUser(int userId) {
		// TODO Auto-generated method stub
		return uRepo.findById((int) userId);
		
	}


	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		System.out.println(uRepo);
		System.out.println(uRepo.findAll());
		return uRepo.findAll();
	}

	@Override
	public User updateUser(User user) {
		user.setEnabled(true);
		return uRepo.save(user);
		
	}


	@Override
	public void deleteUser(int UserID) {
		// TODO Auto-generated method stub
		uRepo.deleteById(UserID);
	}

	@Override
	public void addRoleToUser(String username, String roleName) {

		User user = uRepo.findByUsername(username);
//		Role role = rRepo.findByname(roleName);
	}

	@Override
	public User getUser(Integer id) {
		// TODO Auto-generated method stub
		return uRepo.findById(id).get();
	}


	@Override
	public void saveRole(Role role) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Role> getRoles(){
		return rRepo.findAll();
	}


	@Override
	public User getUser(String username) {
		
		User user = uRepo.findUserByUsername(username);
		return user;
	}


	@Override
	public Boolean findByUsername(String username) {
		
			User user = uRepo.findUserByUsername(username);
			
			if (user == null) {
				return false;
			}else {
				return true;
			}
		
		
	}


	@Override
	public Boolean findByEmail(String email) {
		User user = uRepo.findUserByEmail(email);
		
		if (user == null) {
			return false;
		}else {
			return true;
		}
		}

	@Override
	public void sendVerificationEmail(User user) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public boolean verify(String verificationCode) {
		User user = uRepo.findByVerificationCode(verificationCode);
		System.out.println("================"+user.isEnabled());
		if (user == null || user.isEnabled()){
			return false;
			
		}else {
			user.setVerificationCode(null);
			user.setEnabled(true);
			uRepo.save(user);
			return true;
		}
		
		
	}
	
	@Override
	public void updateResetPassword(String token, String email) throws UserNotFoundException {
		User user = uRepo.findUserByEmail(email);
		
		if (user !=null) {
			user.setResetPasswordToken(token);
			uRepo.save(user);
		}else {
			throw new UserNotFoundException("找不到此Email" + email);
		}
		
	}
	
	@Override
	public User get(String restPasswordToken) {
		return uRepo.findByResetPasswordToken(restPasswordToken);
	}
	
	@Override
	public void updatePassword(User user , String newPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(newPassword);
		
		user.setPassword(encodePassword);
		user.setResetPasswordToken(null);
		
		uRepo.save(user);
		
	}

	@Override
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return uRepo.findUserByEmail(email);
	}

	@Override
	public User createNewUserAfterOAuthLoginSuccess(String email, String name, AuthenticationProvider provider) {

		User user = new User();
		user.setUsername(email);
		user.setPassword(name);
		user.setEmail(email);
		user.setName(name);
		Role roleUser =  rRepo.findByName("MEMBER");
		user.addRole(roleUser);
		user.setEnabled(true);
		user.setAuthenticationProvider(provider);
		
		uRepo.save(user);
		
		return user;
	}

	@Override
	public User findUserByUsername(String string) {

		return uRepo.findByUsername(string);
		
	}

	
	


	//新增
	public String findUserNameById(int id) {
		
		return uRepo.findById(id).get().getName();
	}
	
	
}
