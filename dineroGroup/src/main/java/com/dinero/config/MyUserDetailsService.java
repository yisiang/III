package com.dinero.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.dinero.model.User;
import com.dinero.model.UserRepository;

public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		
		if (user == null) {
			System.out.println(user);
			throw new UsernameNotFoundException("Could not find user");

		}
		
		return new MyUserDetails(user);
	}

}
