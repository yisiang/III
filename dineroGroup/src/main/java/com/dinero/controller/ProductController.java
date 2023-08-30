package com.dinero.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;


import com.dinero.model.Product;
import com.dinero.model.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
//	@GetMapping("/productmain.controller")
//	public String processQueryAllAction(Model m){
//		m.addAttribute("productList",pService.findAll());
//		m.addAttribute("product",new Product());
//		return "ProductForm";
//	}
	
	@GetMapping("/createproduct.controller")
	public String createProductForm(Model m) {
		m.addAttribute("product",new Product());
		return "products/CreateProductNew";
	}
		
	@PostMapping("/createproduct.controller")
	public String processInsertAction(@ModelAttribute("product")Product p,@RequestParam("img_upload_base")String prodImg) {
//		Product product = new Product();
//		product.setProdName("wood");
//		product.setPrice(100);
//		product.setDescript("good");
//		product.setStock(50);
//		product.setCategory("toy");
//		product.setPetkind("cat");
		p.setProdImg(prodImg);
		pService.insert(p);
		
		return "redirect:/productform.controller";
	}
	
	@GetMapping("/updateproduct.controller")
	public String updateProductForm(Model m,@RequestParam("prodId")int prodId) {
//		m.addAttribute("product",new Product());
		m.addAttribute("product",pService.findById(prodId));
		
		return "products/UpdateProductNew";
	}
	
	
	@PostMapping("/updateproduct.controller")
	public String processUpdateAction(@ModelAttribute("product")Product p,@RequestParam("img_upload_base")String prodImg) {
//		Product product = new Product();
//		product.setProdId(3003);
//		product.setProdName("can");
//		product.setPrice(50);
//		product.setDescript("goodd");
//		product.setStock(20);
//		product.setCategory("罐頭");
//		product.setPetkind("cat");
		p.setProdImg(prodImg);
		pService.update(p);
		
		return "redirect:/productform.controller";
	}
	
	
	@PostMapping("/deleteproduct.controller")
	public String processDeleteByIdAction(@RequestParam("prodId")int prodId) {
		pService.deleteById(prodId);
		return "redirect:/productform.controller";
	}
	

	
	@GetMapping("/productform.controller")
	public String productMainForm(Model m) {
		m.addAttribute("productList",pService.findAll());
		m.addAttribute("product",new Product());
		return "products/productFormNew";
	}



}
