package com.dinero.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dinero.model.IUserService;
import com.dinero.model.Product;
import com.dinero.model.ProductDetail;
import com.dinero.model.ProductDetailRepository;
import com.dinero.model.ProductService;
import com.dinero.model.User;
import com.dinero.util.DineroException;

@Controller
@SessionAttributes({"name"})
public class ProductUserController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ProductDetailRepository pdRepo;
	
	@GetMapping("/productuserform.controller")
	public String productsUserForm(Model m) {
		m.addAttribute("productList", pService.findAll());
		List<ProductDetail> list = pdRepo.findhot();
//		List<Product> pdList=new ArrayList<Product>();
//		for(ProductDetail p:list) {
//			pdList.add(pService.findById(p.getProdId()));
//		}
		m.addAttribute("hot",list);
		return "/products/productUserForm";
	}
	
	
	@GetMapping("/index")
	public String index(Model m , HttpServletRequest request) {
		User user = null;

		user = (User) request.getSession(true).getAttribute("sessionuser");
		if(user == null) {
			
				throw new DineroException("您需登入才可進行後續操作");
			
		}
		
		System.out.println("============="+user);
		String name;
		try {
			name = user.getName();
		}catch (NullPointerException e) {
			e.printStackTrace();
			name ="訪客";
		}
				
		m.addAttribute("name" , name);
		m.addAttribute("productList", pService.findAll());
		List<ProductDetail> list = pdRepo.findhot();
		m.addAttribute("hot",list);

		return "index" ;
	}
	
	@GetMapping("/productlist")
	public String productsReadByCate(Model m,@RequestParam("category")String category,@RequestParam("petkind")String petkind) {
		m.addAttribute("productList", pService.findByCateKind(category, petkind));
		return "/products/productUserForm";
	}
	
//	@GetMapping("/productlist1")
//	public String productsReadByCate1(Model m) {
//		m.addAttribute("productList", pService.findByCateKind("飼料","狗"));
//		return "/products/productUserForm";
//	}
//	
//	@GetMapping("/productlist2")
//	public String productsReadByCate2(Model m) {
//		m.addAttribute("productList", pService.findByCateKind("罐頭","狗"));
//		return "/products/productUserForm";
//	}
	
	//推薦相關商品
	@GetMapping("/productdetail")
	public String productDetail(Model m,@RequestParam("prodId")int prodId,@RequestParam("category")String category,@RequestParam("petkind")String petkind) {
		m.addAttribute("product",pService.findById(prodId));
		Random rand = new Random();
		List<Product> list = pService.findByCateKind(category, petkind);
		Set<Product> newList = new HashSet<>();
		for(int i = 1;i<=4;i++) {
	           int randomIndex = rand.nextInt(list.size());
	           
	            // add element in temporary list
	            newList.add(list.get(randomIndex));
		}
		m.addAttribute("productsug",newList);
//		m.addAttribute("productsug",pService.findBySuggest(category, petkind));
//		System.out.println(pService.findBySuggest(category, petkind).get(0).getProdName());
		return "/products/productDetail";
	}
	
	//搜尋
	@GetMapping("/searchproduct")
	public String findByName(Model m,@RequestParam("prodName")String prodName){
		m.addAttribute(pService.findProducts(prodName));
		List<ProductDetail> list = pdRepo.findhot(); //熱門商品
		m.addAttribute("hot",list);
		
		return "/products/productUserForm";
	}
	
	@GetMapping("/test")
	@ResponseBody
	public List<ProductDetail> test() {
		System.out.println((pdRepo.findhot()));
		return (pdRepo.findhot());
	}
	
	//收藏
	@GetMapping("/clicklike")
	public String productLike(@RequestParam("prodId")int prodId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession(true);
		User user= (User) httpSession.getAttribute("sessionuser");
		if(user == null) {
			
			throw new DineroException("您需登入才可進行後續操作");
		
		}
		Set<User> userlike = new HashSet<User>();
		userlike.add(user);
//	    System.out.println(user.getUserId());
//		user.getUserId();
		Product product = pService.findById(prodId);
		if(!product.getUsers().contains(user)) {
			product.setUsers(userlike);
			pService.insert(product);
		}else {
//			product.setUsers(null);
			product.getUsers().remove(user);
			pService.insert(product);
		}
		return "redirect:/productuserform.controller";
			
	}
	
	@Autowired
	private IUserService userService;
	
	
	@GetMapping("/likepage")
	public String likepage(Model m,HttpServletRequest request) {
		HttpSession httpSession = request.getSession(true);
		User user =(User)httpSession.getAttribute("sessionuser");
		if(user == null) {
			
			throw new DineroException("您需登入才可進行後續操作");
		
		}
		user = userService.getUser(user.getUserId());

		Set<Product> productlike = user.getProductlike();
		m.addAttribute("likeList",productlike);
		
		return "/products/productLike";
	}
	
	//刪除收藏
	@GetMapping("/dislike")
	public String productDelete(@RequestParam("prodId")int prodId,HttpServletRequest request) {
		HttpSession httpSession = request.getSession(true);
		User user= (User) httpSession.getAttribute("sessionuser");
		if(user == null) {
			
			throw new DineroException("您需登入才可進行後續操作");
		
		}
		Product product = pService.findById(prodId);
		product.setUsers(null);
		user.getProductlike().remove(product);
//		Set<Product> productlikeSet = user.getProductlike();
//
//
//		Product product = pService.findById(prodId);
//
//
//
//			productlikeSet.remove(product);
			pService.insert(product);
		
		return "redirect:/likepage";
			
	}
}
