package com.dinero.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutController{

	@RequestMapping(path = "/logout")
	public String processMainAction(HttpServletRequest request ) {
		request.getSession().invalidate();
		return "/showMyLoginPage";
	}
}
