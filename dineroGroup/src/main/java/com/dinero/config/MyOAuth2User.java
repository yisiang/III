package com.dinero.config;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;


public class MyOAuth2User implements OAuth2User{

	private OAuth2User oAuth2User;
	
	@Autowired
	public MyOAuth2User(OAuth2User oAuth2User) {
		this.oAuth2User = oAuth2User;
	}
	
	
	@Override
	public Map<String, Object> getAttributes() {
		
		return oAuth2User.getAttributes();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return oAuth2User.getAuthorities();
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return oAuth2User.getAttribute("name");
	}
	
	public String getFullName() {
		return oAuth2User.getAttribute("name");
	}
	
	public String getEmail() {
		return oAuth2User.getAttribute("email");
	}
	
}
