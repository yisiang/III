package com.dinero.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Servlet implementation class HomeLoginController
 */
@Controller
public class HomeLoginController  {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
    @RequestMapping(path = "/HomeLoginController")
 protected String ProcessActoin( @RequestParam("homeTowhere") String homeTowhere)  {
   //System.out.println("in servlet");
//   String user = "abc" ;
    
    if(homeTowhere.equals("toOrd")) {
     return"redirect:/toCartHome";
    }else if(homeTowhere.equals("toUser")){
     return "redirect:/users/findusers";
    }else if(homeTowhere.equals("toProduct")) {
     return "redirect:/productmain.controller"; 
    }else if (homeTowhere.equals("toActivity")) {
     return "redirect:/activities";
    }else if (homeTowhere.equals("toBulletin")) {
     return "/messageboard/messageIndex";
   }
     
   
  return homeTowhere;
   
   
  
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */

    @RequestMapping(path = "/test")
 protected String BackToHome()  {
     return"users/cc";
    }
}