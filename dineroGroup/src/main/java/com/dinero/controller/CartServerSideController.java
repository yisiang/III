package com.dinero.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.ast.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dinero.model.CartBean;
import com.dinero.model.CartItemBean;
import com.dinero.model.CouponBean;
import com.dinero.model.CouponService;
import com.dinero.model.ICartItemService;
import com.dinero.model.ICartService;
import com.dinero.model.IUserService;
import com.dinero.util.CartExcelExporter;




@Controller
@SessionAttributes(names = {"searchedOrds","userService"})
public class CartServerSideController {
	
	@Autowired
	ICartService cartService ;
	
	@Autowired
	ICartItemService cartItemService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private IUserService userService;
	
	@GetMapping(path = "/cart")
	private String processSelectAll(Model model) {
		
		List<CartBean> ords = cartService.selectAll();
		model.addAttribute("userService",userService);
		model.addAttribute("ords", ords);
		
		return "gewei/ServerSideManager";
	}
	
	@GetMapping(path = "/cart/serversidetest")
	private String test(Model model) {
		List<CartBean> ords = cartService.selectAll();
		model.addAttribute("ords", ords);
		return "gewei/ServerSideManagerOriginal";
	}
	
	@GetMapping(path = "/cart/{cartId}")
	private String processShowUtiwake(@PathVariable("cartId") String cartIdStr 
			,Model model) {
		
		int cartId = Integer.parseInt(cartIdStr);
		List<CouponBean> coupons = cartService.selectByid(cartId).getCoupons();
		List<CartItemBean> items = cartItemService.selectByCartId(cartId);
		
		model.addAttribute("ord", items);
		model.addAttribute("cartId",cartId);
		model.addAttribute("coupons", coupons);
		
		return "gewei/Uchiwake";
	}
	
	@GetMapping(path = "/cart/orderSelectBy")
	private String selectByCondition(@RequestParam("selectBy") String selectBy
			,@RequestParam("custId") String custId ,@RequestParam("cartId")String cartId
			,@RequestParam("minTotal")String minTotal,@RequestParam("maxTotal")String maxTotal
			,@RequestParam("minDate")String minDate ,@RequestParam("maxDate")String maxDate
			,Model model) {
		
		if(selectBy.equals("advanced")) {
			
			advancedSelect(model, cartId, custId, minTotal, maxTotal, minDate, maxDate);
			
		}else if (selectBy.equals("custId")) {
			
			selectByCustId(model, custId);
			
		}else if (selectBy.equals("cartId")) {
			
			selectByCartId(model, cartId);
			
		}else if (selectBy.equals("cartTotal")) {
			
			selectByTotal(model, minTotal, maxTotal);
			
		}else if(selectBy.equals("tradeDate")){
			
			selectByTradeDate(model, minDate, maxDate);
		}
		
		
		return "gewei/SearchedOutcome";
	}
	
	private void selectByCustId(Model model,String custIdStr) {
		int custId =Integer.parseInt(custIdStr);
		List<CartBean> ords = cartService.selectOrdByCustId(custId);
		model.addAttribute("searchedOrds", ords);
		
	}
	
	private void selectByCartId(Model model,String cartIdStr) {
		
		int cartId =Integer.parseInt(cartIdStr);  
		//嚇到 怎麼當時知道這樣寫
		List<CartBean> ords = new ArrayList<CartBean>();
		
		CartBean ord = cartService.selectByCartId(cartId);
		
		ords.add(ord);
		
		model.addAttribute("searchedOrds", ords);
		
	}
	
	private void selectByTotal(Model model,String minTotal ,String maxTotal) {
		
		List<CartBean> ords = cartService.selectByTotal(minTotal, maxTotal);
		model.addAttribute("searchedOrds", ords);
	}
	
	private void selectByTradeDate(Model model,String minDate ,String maxDate) {
		
		List<CartBean> ords = cartService.selectByDate(minDate, maxDate);
		model.addAttribute("searchedOrds", ords);
	}
	
	private void advancedSelect(Model model,String cartId ,String custId ,String minTotal , String maxTotal ,String minDate ,String maxDate) {
		
		List<CartBean> ords = cartService.advancedSelect(cartId, custId, minTotal, maxTotal, minDate, maxDate);
		
		model.addAttribute("searchedOrds", ords);
	}
	
	@GetMapping("/cart/export/excelAll")
	private void exportToExcel(HttpServletResponse response) {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=carts_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<CartBean> listCart = cartService.selectAll();
        CartExcelExporter<CartBean> exporter = new CartExcelExporter<CartBean>(listCart);
        try {
			exporter.export(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/cart/export/excelSearched")
	private void exportSearchedToExcel(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=searchedCarts_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<CartBean> listCart = (List<CartBean>)request.getSession().getAttribute("searchedOrds");
        CartExcelExporter<CartBean> exporter = new CartExcelExporter<CartBean>(listCart);
        try {
			exporter.export(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/cart/export/cartItemExcell")
	private void exportItemToExcel(HttpServletResponse response) {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=cartItems_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<CartItemBean> list = cartItemService.findAll();
        CartExcelExporter<CartItemBean> exporter = new CartExcelExporter<CartItemBean>(list);
        try {
			exporter.export(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/cart/acceptrefund")
	private String acceptRefund(@RequestParam("cartId")int cartId,Model model) {
		
		cartService.acceptRefund(cartId);
		List<CartBean> ords = cartService.selectAll();
		model.addAttribute("ords", ords);
		
		
		return "gewei/ServerSideManager";
	}
	
	@PostMapping("/cart/rejectrefund")
	private String rejectRefund(@RequestParam("cartId")int cartId,Model model) {
		
		cartService.rejectRefund(cartId);
		List<CartBean> ords = cartService.selectAll();
		model.addAttribute("ords", ords);
		
		return "gewei/ServerSideManager";
	}
	
	@PostMapping("/cart/ship")
	private String ship(@RequestParam("cartId")int cartId,Model model) {
		
		cartService.shipOrd(cartId);
		List<CartBean> ords = cartService.selectAll();
		model.addAttribute("ords", ords);
		
		return "gewei/ServerSideManager";
	}
}
