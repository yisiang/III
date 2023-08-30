package com.dinero.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthenticationSuccessHandler authMemmerSuccessHandler;
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new MyUserDetailsService();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setPasswordEncoder(passwordEncoder());
		authProvider.setUserDetailsService(userDetailsService());
		
		return authProvider;
	}
	
	@Autowired
	private MyOAuth2UserService oAuth2UserService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.authenticationProvider(authenticationProvider());
	}

//	@Override
//	public void configure(WebSecurity web) throws Exception {
//		// TODO Auto-generated method stub
//		super.configure(web);
//	}
	
	@Autowired
	private OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		
		http
		  .authorizeRequests()
		  .antMatchers(HttpMethod.GET,"/users/**","/oauth/**").hasAnyAuthority("ADMIN","MANAGER","EMPLOYEE")
//		  .antMatchers(HttpMethod.GET,"/users/**").authenticated()
		  .antMatchers(HttpMethod.GET).permitAll()		  
		  .antMatchers(HttpMethod.POST,"/users/**","/oauth/**").hasAnyAuthority("ADMIN","MANAGER","EMPLOYEE")
//		  .antMatchers(HttpMethod.POST,"/users/**").authenticated()
		  .antMatchers(HttpMethod.POST).permitAll()
		  .anyRequest().permitAll() //任何請求,登陸後可以訪問
		  .and()
		  .csrf().disable()
		  .rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
		  .and()
		  .formLogin().loginPage("/showMyLoginPage")
		  .loginProcessingUrl("/autenticateTheUser")
//		  .defaultSuccessUrl("/users/findusers")
		  .successHandler(authMemmerSuccessHandler)
		  .permitAll()
		  .and()
		  .oauth2Login()
	  		.loginPage("/showMyLoginPage")
	  		.userInfoEndpoint()
	  		.userService(oAuth2UserService)
	  	 .and()
			.successHandler(oAuth2LoginSuccessHandler)
	  	 .and()
		  .logout().permitAll();
	}

}
