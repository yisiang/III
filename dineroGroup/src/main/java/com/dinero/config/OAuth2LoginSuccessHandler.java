package com.dinero.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.dinero.model.AuthenticationProvider;
import com.dinero.model.IUserService;
import com.dinero.model.User;

@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

	@Autowired
	private IUserService uService;

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			 Authentication authentication ) throws IOException, ServletException {
		
		MyOAuth2User oAuth2User = (MyOAuth2User)authentication.getPrincipal();
		String email = oAuth2User.getEmail();
		String name = oAuth2User.getName();
		User user = uService.findUserByEmail(email);


		if (user == null) {
			user = uService.createNewUserAfterOAuthLoginSuccess(email , name, AuthenticationProvider.GOOGLE);
			request.getSession().setAttribute("sessionuser",user);
			System.out.println(user);
			response.sendRedirect("/dinero/index");
		}else {
			request.getSession().setAttribute("sessionuser",user);
			response.sendRedirect("/dinero/index");
		}
		
		
	}
	
}
