package com.dinero.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.dinero.model.CouponBean;
import com.dinero.model.CouponService;
import com.dinero.model.IGeProductService;
import com.dinero.util.CartExcelExporter;
import com.dinero.util.DateTransformer;



@Controller
@SessionAttributes
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private IGeProductService productService;
	
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/coupon/insert")
	private String toInsetPage(Model model) {
		
		//List<DiscountType> discountTypeList = Arrays.asList(DiscountType.values());
		
		CouponBean couponBean = new CouponBean();
		model.addAttribute("command", couponBean);
		return "gewei/CreateCoupon";
	}
	
	@GetMapping("/coupon/coupontest")
	private String toTestInsetPage(Model model) {
		
		//List<DiscountType> discountTypeList = Arrays.asList(DiscountType.values());
		
		CouponBean couponBean = new CouponBean();
		model.addAttribute("command", couponBean);
		return "gewei/CreateCouponOriginal";
	}
	
	@PostMapping("/coupon/insert")
	//@ResponseBody CouponBean
	private  String createNewCoupon(@Valid @ModelAttribute("command") CouponBean coupon ,BindingResult theBindingResult) {
		
		System.out.println("Binding result"+ theBindingResult);
		
		if(theBindingResult.hasErrors()) {
			return "gewei/CreateCoupon";
		}
		
		DateTransformer dtf = new DateTransformer();
		coupon.setCreateDate(dtf.newStringDate());
		couponService.insert(coupon);
		
		return "redirect:/coupon";
	}
	
	@GetMapping("/coupon/couponCode")
	private @ResponseBody String testFindAllCouponCode(@RequestParam("couponInput") String input){
		
		
		
		String repeatedCouponCode = couponService.getRepeatedCouponCode(input);
		
		if(repeatedCouponCode == null) {
			return "Y";
		}
		
		return "N";
	}
	
	@GetMapping("/coupon/alreadyExistCoupons")
	private @ResponseBody List<CouponBean> getAllTimeoverllappingBean(@RequestParam("validFrom") String start, @RequestParam("validUntil")String end){
		
//		String start = "2022-04-21 00:00:00";
//		String end = "2022-04-23 00:00:00";
		System.out.println(start);
		System.out.println(end);
		
		List<CouponBean> overLappCoupons = couponService.findOverLappCoupon(start, end);
		
		return overLappCoupons;
	}
	
	@GetMapping("/coupon/giveyouallproductname")
	private @ResponseBody List<String> getAllProductName(){
		return productService.selectAllDistinctProdName();
	}
	
	@GetMapping("/coupon/giveyouallproducttype")
	private @ResponseBody List<String> getAllProductType(){
		return productService.selectAllDistinctProdType();
	}
	
	@GetMapping("/coupon")
	private String tomainpage(Model model) {
		model.addAttribute("coupons", couponService.findAll());
		return "gewei/CouponServerSideManager";
	}
	
	@PostMapping("/coupon/update")
	private String toupdatepage(Model model ,@RequestParam("couponId")Integer couponId) {
		
		CouponBean couponBean = couponService.findById(couponId);
		
		model.addAttribute("command", couponBean);
		
		return "gewei/CreateCoupon";
	}
	
	@PostMapping("/coupon/delete")
	private String deleteprocess(@RequestParam("couponId") Integer couponId) {
		
		couponService.deleteById(couponId);
		
		return "redirect:/coupon";
	}
	
	@GetMapping("/coupon/push")
	private  String sendCouponMail(@RequestParam("couponId") Integer couponId) {
		
		CouponBean coupon = couponService.findById(couponId);
		couponService.sendMail(coupon);
		
		return "redirect:/coupon";
	}
	
	@GetMapping("/coupon/export/excelAll")
	private void exportToExcel(HttpServletResponse response) {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=coupons_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<CouponBean> listCart = couponService.findAll();
        CartExcelExporter<CouponBean> exporter = new CartExcelExporter<CouponBean>(listCart);
        try {
			exporter.export(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
