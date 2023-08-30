package com.dinero.config;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/login/page").setViewName("login/dinero-login");
//		registry.addViewController("/users").setViewName("profiles/profiles-list");
//		registry.addViewController("/logout").setViewName("logoutResult");
//		registry.addViewController("/logout/page").setViewName("logout");	
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		
		Path photoUploadDir = Paths.get("./users-photo");
		String photoUploadPath = photoUploadDir.toFile().getAbsolutePath();
		
		registry.addResourceHandler("/users-photo/**").addResourceLocations("file:/" +photoUploadPath +"/");

	
				
	}
	
}
