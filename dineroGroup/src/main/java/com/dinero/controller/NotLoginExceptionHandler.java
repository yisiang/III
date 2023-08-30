package com.dinero.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.dinero.util.DineroException;

@ControllerAdvice
public class NotLoginExceptionHandler {
	
	@ExceptionHandler(DineroException.class)
	public String notLogInHandler(DineroException e ,Model model) {
		
		model.addAttribute("notloginerror", e);
		
		return "gewei/NotLogIn";
	}
}
