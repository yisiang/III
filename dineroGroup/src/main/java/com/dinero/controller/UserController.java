package com.dinero.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dinero.model.IUserService;
import com.dinero.model.Role;
import com.dinero.model.RoleRepository;
import com.dinero.model.User;




//controllerName
@Controller
	public class UserController  {
	
	@Autowired
	private IUserService uService;

	

	@GetMapping(path = "/users/findusers")
	private String listUser(Model m ,HttpServletRequest request) {
//		User user= (User) request.getSession().getAttribute("sessionuser");
//		System.out.println(user.getUserId());
		
		List<User> list = uService.selectAllUser();
		System.out.println(list);
		m.addAttribute("listUser", list);
		return"users/users-list";
	}

	
	@GetMapping(path = "/users/findusers2")
	@ResponseBody
	private List<User> findAllUsers(){
		return uService.selectAllUser();
		
	}
	
	
	@RequestMapping(path = "/users.new")
	private String showNewForm() {
		System.out.println("turn page");
		return"users/createUser";
	}

	@RequestMapping(path = "/users/edit/{id}")
	private String showEditForm(@PathVariable("id") int userId,Model m) {
		User existingUser = uService.getUser(userId);
		List<Role> listRoles = uService.getRoles();
		
		System.out.println("=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_");
		System.out.println(existingUser);
		System.out.println(existingUser.getUserId());
		m.addAttribute("User", existingUser);
		m.addAttribute("listRoles",listRoles);
		System.out.println(listRoles);
		return "users/updateUser";

	}

	@PostMapping(path = "/users.insertadmin")
	private String insertUser (@ModelAttribute(name = "user") User user, @RequestParam("fileImage") MultipartFile multipartFile) throws IOException{
//		User newUser = new User(username, password, name, email);

		// 如果要用 MultipartFile  一定要POST
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		user.setPhoto(fileName);
		User saveUser = uService.updateUser(user);
		
		String uploadDir = "users-photo/"+saveUser.getUserId() ;
		Path uploadPath = Paths.get(uploadDir);
		
		if(!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		
		try {
			InputStream inputStream = multipartFile.getInputStream();
			Path filePath = uploadPath.resolve(fileName);
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			
		} catch (Exception e) {
			throw new IOException("照片無法儲存" + fileName);
		}
		System.out.println(uploadPath);
		
		uService.insertAdmin(user); 

		return "redirect:/users/findusers";

	}
	@GetMapping(path = "/users/updatePassword")
	private String turnPasswordForm(Principal principal , String password) {

		return "users/updatePassword";
	}
	
	@PostMapping(path = "/users/updatePassword")
	private String updateUserPassword(Principal principal , String password , Model m) {
		String username = principal.getName();
		User user = uService.findUserByUsername(username);
		
		uService.updatePassword(user, password);
		m.addAttribute("success","密碼更新成功");
		return "users/updatePassword";
	}
	
	
	
	@RequestMapping(path = "/users/update",method = RequestMethod.POST)
	private String updateUser(@ModelAttribute(name = "user") User user , @RequestParam("fileImage") MultipartFile multipartFile) throws IOException {
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		user.setPhoto(fileName);
		User saveUser = uService.updateUser(user);
		
		String uploadDir = "users-photo/"+saveUser.getUserId() ;
		Path uploadPath = Paths.get(uploadDir);
		System.out.println("============================");
		System.out.println(fileName);
		
		
		if(!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		
		try {
			InputStream inputStream = multipartFile.getInputStream();
			Path filePath = uploadPath.resolve(fileName);
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			
		} catch (Exception e) {
			throw new IOException("照片無法儲存" + fileName);
		}
		

		return "redirect:/users/findusers";
	}

	@RequestMapping(path = "/users.delete",method = RequestMethod.GET)
	private String deleteUser(@RequestParam("userId") int userId) {

		uService.deleteUser(userId);

		return "redirect:/users/findusers";
	}
	
	@GetMapping(path = "/cc")
	private String turnToMember() {
		return "users/memberProfile";
	}
	
	@GetMapping("/users/getrprincipal")
	private @ResponseBody Principal getPrinciple(Principal principal) {
		String username = principal.getName();
		
		return principal;
	}
	
	@GetMapping("/users/getauthentication")
	private @ResponseBody Authentication getAuthentication(Authentication authentication) {
		return authentication;
	}
}