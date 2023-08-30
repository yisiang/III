package com.dinero.config;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.dinero.model.IUserService;
import com.dinero.model.User;



@Component
public class AuthMemmerSuccessHandler implements AuthenticationSuccessHandler {
	
	
	@Autowired
	private IUserService uService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(userDetails instanceof MyUserDetails) {
			
			User user = uService.getUser(((MyUserDetails)userDetails).getUsername());
			
			request.getSession().setAttribute("sessionuser",user);
		}
		
		
		if(roles.contains("ADMIN")|| roles.contains("MANAGER") || roles.contains("EMPLOYEE")) {
			response.sendRedirect("/dinero/users/findusers");
		}else {
			response.sendRedirect("/dinero/index");
		}
	}

}
