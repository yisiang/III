package com.dinero.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/activities")
public class ActivityControllerClient {
	
	@Autowired
	
	@GetMapping("/activity.bulletin")  //activities
	public String showAll() {	// showAll 是自己命名的方法
	
		return "ActJSPclient/clientIndex";
	}
	
	@GetMapping("/activity.readmore/1")  //activities
	public String readMoreActId1() {	// readMoreActId1 是自己命名的方法
		
		return "ActJSPclient/clientReadMoreActId1";
	}
	
	@GetMapping("/activity.enroll/1")  //activities
	public String enrollSuccessActId1() {	// enrollSuccessActId1 是自己命名的方法
		
		return "ActJSPclient/clientEnrollSuccessActId1";
	}
	
	@GetMapping("/activity.readmore/16")  
	public String readMoreActId16() {	
		
		return "ActJSPclient/clientReadMoreActId16";
	}
	
	@GetMapping("/activity.enroll/16") 
	public String enrollSuccessActId16() {	
		
		return "ActJSPclient/clientEnrollSuccessActId1";
	}

}