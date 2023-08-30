package com.dinero.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dinero.model.GeProductBean;
import com.dinero.model.IGeProductService;



@Controller
public class GeProductController {

	@Autowired
	private IGeProductService service;
	
	@RequestMapping(path = "/shop/geShowProductList" , method=RequestMethod.GET)
	private String showProductList( Model model) {
		
	
			List<GeProductBean> list = service.selectAll();
			model.addAttribute("products", list);
			return "gewei/ShowProductLList";
	}
	
	@GetMapping("/shop/geShowProduct")
	private String showProduct(@RequestParam("prodId") String prodIdStr , Model model) {
		
		int prodId = Integer.parseInt(prodIdStr);
		GeProductBean product = service.selectById(prodId);
		//這邊set 一個 叫product 的att
		model.addAttribute("product", product);
		return "gewei/ShowProduct";
		
	}
	
	
}
