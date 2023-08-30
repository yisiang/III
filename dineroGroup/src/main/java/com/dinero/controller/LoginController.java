package com.dinero.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.bcel.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dinero.model.IUserService;
import com.dinero.model.Role;
import com.dinero.model.RoleRepository;
import com.dinero.model.User;
import com.dinero.model.UserNotFoundException;
import com.dinero.util.SiteUtility;

import net.bytebuddy.utility.RandomString;

@Controller
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Autowired
	private IUserService uService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	
	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
//		return "login/loginpage";
		return "login/dinero-login";
	}
	
	
	@GetMapping("/showmemberregist")
	public String memberregist() {
		return "register/register" ;
	}
	
	
	@GetMapping("/")
	public String goToIndex() {
		return "index";
	}
	
	@RequestMapping(path = "/memberregister", method = RequestMethod.POST)
	private String register(User user, Model m , HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
		
	
			uService.insertUser(user);
			
			String siteURL = SiteUtility.getSiteURL(request);
			uService.sendVerificationEmail(user,siteURL);
			
			
			m.addAttribute("NOTIFICATION", "恭喜註冊成功! 請查看您的信箱進行帳號認證");
			
			return "register/register";
	}
	
	
	
	@PostMapping("/checkUsername/{username}")
	@ResponseBody
	private Boolean CheckUsername(@PathVariable("username") String username) {
		
		System.out.println(username);
		System.out.println(uService.findByUsername(username));
		return uService.findByUsername(username);
		
	}
	
	
	@PostMapping("/checkEmail/{email}")
	@ResponseBody
	private Boolean CheckEmail(@PathVariable("email") String email) {
		
		return uService.findByEmail(email);
		
	}
	
	
	@GetMapping("/verify")
	public String verifyAccount(@Param("code") String code , Model m) {
		boolean verified = uService.verify(code);
		
		
		String pageTitle = verified ? "驗證成功!!" : "驗證失敗!" ;
		m.addAttribute("pageTitle" , pageTitle);
		
		
		return "register/" + (verified ? "registSuccess" : "registFail");
	}
	
	
	@GetMapping("/forgotPassword")
	public String showForgotPaswordForm(Model m) {
		m.addAttribute("pageTitle","Forgot Password") ; 
		return "login/forgotPasswordForm" ; 
	}
	
	@PostMapping("/forgotPassword")
	public String processForgotPasswordForm(@RequestParam("email") String email , Model m , HttpServletRequest request) {
		String token = RandomString.make(45);
		
		try {
			uService.updateResetPassword(token, email);
			
			String resetPasswordLink = SiteUtility.getSiteURL(request) + "/resetPassword?token=" + token ;
			
			uService.sendForgetPasswordEmail(email , resetPasswordLink);
			
			m.addAttribute("message", "信件已寄送成功，請查看您的信箱!");
		}
			catch (UnsupportedEncodingException | MessagingException e) {
				// TODO Auto-generated catch block
				m.addAttribute("error", "此信箱尚未被註冊");
			}
			catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			m.addAttribute("error", "此信箱尚未被註冊");
		}
		return "login/forgotPasswordForm";
	}

	@GetMapping("/resetPassword")
	public String showResetPasswordForm(@Param("token") String token , Model m) {
		
		User user = uService.get(token);
		if (user != null) {
			m.addAttribute("token",token);
			return "login/resetPasswordForm" ;
			
		}
		
		m.addAttribute("message" , "無效的Token");
		return "login/resetPasswordForm";
	}
	
	@PostMapping("/resetPassword")
	public String processResetPassword(@RequestParam("token") String token , @RequestParam("password") String password,  Model m) {
		
		User user = uService.get(token);
		
		if (user == null) {
			m.addAttribute("message" , "無效的Token");
						
		}else {
			uService.updatePassword(user, password);
			m.addAttribute("message" , "您的密碼已更新成功!");
		}
		
		return "login/resetPasswordForm";
	}
	

	
	
//	@GetMapping("/users")
//	public String gotoUser() {
//		return "redirect:/";
//	}
//	
//	@Autowired
//	private LoginDao loginDao;
//
//	@RequestMapping(path = "/login", method = RequestMethod.GET)
//	public String processMainAction() {
//		return "login/login";
//	}
//
//	@RequestMapping(path = "/checklogin", method = RequestMethod.POST)
//	// 跟 jsp 相呼應的名字
//	public String processAction(@RequestParam("username") String username, @RequestParam("password") String password,
//			Model m, User user) {
//
//		Map<String, String> notification = new HashMap<String, String>();
//		m.addAttribute("notification", notification);
//
//		boolean status = loginDao.validate(new LoginBean(username, password));
//
//		if (status) {
//			m.addAttribute("username", username);
//			m.addAttribute("password", password);
//			m.addAttribute("userNowLogin", user);
//
//			return "dineroHome";
//
//		}
//
//		notification.put("msg", "請輸入正確的帳號密碼!!");
//		return "login/login";
//
//	}

}