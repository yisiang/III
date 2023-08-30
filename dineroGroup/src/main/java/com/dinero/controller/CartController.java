package com.dinero.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dinero.model.CartBean;
import com.dinero.model.CartItemBean;
import com.dinero.model.CouponBean;
import com.dinero.model.CouponService;
import com.dinero.model.GeProductBean;
import com.dinero.model.GeweiGreenService;
import com.dinero.model.ICartService;
import com.dinero.model.IGeProductService;
import com.dinero.model.Product;
import com.dinero.model.ProductBase64Dao;
import com.dinero.model.ProductDetail;
import com.dinero.model.ProductDetailRepository;
import com.dinero.model.ProductService;
import com.dinero.model.User;
import com.dinero.util.DateTransformer;
import com.dinero.util.DineroException;




@Controller
@SessionAttributes({ "cartDto", "p64dao" ,"usedcouponsid"})
public class CartController {

	@Autowired
	IGeProductService productSrrvice;
	
	@Autowired
	ProductBase64Dao p64dao;
	
	@Autowired
	ICartService cartService;
	
	
	@Autowired
	private CouponService couponService;
	
	//yenlin
	@Autowired
	ProductService pService;
	
	
	@Autowired
	private ProductDetailRepository productDetaulRepo;
	
	@GetMapping(path = "/shop/toCartHome")
	private String toHomePage() {
		return "gewei/cartHome";
	}

	@RequestMapping(path = "/shop/insertIntoCart")
	private String insert( @RequestParam("prodId") String preProdId,
			@RequestParam("price") String prePrice, @RequestParam("qty") String preQty,@RequestParam("from") String fromwhere, Model model,
			HttpServletRequest request) {

		HttpSession httpSession = request.getSession(true);
		CartBean cartSession = (CartBean) httpSession.getAttribute("cartDto");
		
		User loginUser = (User)httpSession.getAttribute("sessionuser");
		if(loginUser == null) {
			System.out.println("在購物車新增但未登入");
			throw new DineroException("您需登入才可進行後續操作");
		}
		
		// 少parse 失敗驗證
		//將 custId 改為 cust的
		int custId = loginUser.getUserId();
		int prodId = Integer.parseInt(preProdId);
		int price = Integer.parseInt(prePrice);
		int qty = Integer.parseInt(preQty);

		Integer stock = productSrrvice.getProdStock(prodId);

		if (stock < qty || qty <= 0) {

			throw new DineroException("存貨不足");

		}
		// 此 controller 所處裡的 cart
		CartBean cart = null;
		boolean existCart = true;

		// 判斷session 當中是否有購物車
		if (cartSession == null) {

			// custId 在第一次購物時綁入 cart
			cart = new CartBean(custId);

			existCart = false;

			// session 中無購物車 之情況
		} else {
			// 此次先不新增 cart外層的判斷有無items list 應該是會有
			if (cartSession.getItems().isEmpty()) {

				System.out.println("from 有list 但沒商品");
				cart = new CartBean(custId);
				existCart = false;

			} else if (!(cartSession.getItems().isEmpty())) {

				System.out.println("from 有 list 有商品");
				cart = cartSession;
				existCart = true;

			}

		}
		// 開始處裡此筆訂單 //價格的部分可以再做修改 可以從前個view 看
		CartItemBean cartItem = new CartItemBean();
		cartItem.setCart(cart);

		GeProductBean product = productSrrvice.selectById(prodId);

		// prodId
		cartItem.setProduct(product);

		// p q sum
		cartItem.setPrice(price);
		cartItem.setQty(qty);
		cartItem.setItemTotal();

		// 此次少一層判斷 //還是要加外面那層不燃乾本進不去 items是空的
		java.util.List<CartItemBean> items = cart.getItems();
		boolean addNewItem = false;

		if (existCart) {
			for (CartItemBean motoItem : items) {

				if (items.isEmpty()) {
					System.out.println("車子為空 跳出迴圈");
					// ConcurrentModificationException
					addNewItem = true;
					break;
				}

				if (motoItem.getProduct().getProdId() == cartItem.getProduct().getProdId()) {
					System.out.println("id 重複");
					motoItem.setQty(motoItem.getQty() + cartItem.getQty());
					motoItem.setItemTotal(cartItem.getItemTotal() + motoItem.getItemTotal());
					addNewItem = false;
					break;
				} else {
					System.out.println("id不重複");
					addNewItem = true;
				}
			}

			if (addNewItem) {
				System.out.println("將商品加入 購物車");
				cart.getItems().add(cartItem);
			}

		} else {
			// System.out.println("在沒 add new item 情況新增");
			cart.getItems().add(cartItem);

		}
		model.addAttribute("cartDto", cart);
		// 我直接存 dao 到session
		model.addAttribute("p64dao", p64dao);
		
		if("productUserForm".equals(fromwhere)) {
			return "redirect:/productuserform.controller";
		}else if ("productDetail".equals(fromwhere)) {
			
			Product prod = pService.findById(prodId);
		
			String url;
			try {
				url = "redirect:/productdetail?prodId="+prodId+"&category="+URLEncoder.encode(prod.getCategory(), "UTF-8")+"&petkind="+URLEncoder.encode(prod.getPetkind(), "UTF-8");
				return url;
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
			
		}
		return "gewei/cartOutcome";
	}
	
	@RequestMapping(path = "/shop/deleteItemFromCart",method = RequestMethod.POST)
	private String delete(@RequestParam("index")String indexStr ,@ModelAttribute("cartDto")CartBean cartDto) {
		System.out.println("delete=============");
		
		int index = Integer.parseInt(indexStr);	
		List<CartItemBean> items = cartDto.getItems();
		items.remove(index);
		cartDto.setItems(items);
		
		return "gewei/cartOutcome";
	}
	
	@RequestMapping(path = "/shop/editItemFromCart",method = RequestMethod.POST)
	private String edit(@RequestParam("newQty")String newQtyStr 
			,@RequestParam("prodId")String prodIdStr
			,@RequestParam("index")String indexStr
			,@ModelAttribute("cartDto") CartBean cartDto) {
		System.out.println("edit=============");
		
		//新數量的後端驗證未做
		int newQty = Integer.parseInt(newQtyStr);
		int prodId = Integer.parseInt(prodIdStr);
		int index  = Integer.parseInt(indexStr);
		
		Integer stock = productSrrvice.getProdStock(prodId);
		
		if(newQty > stock || newQty <= 0) {
			cartDto.getItems().remove(index);
			throw new DineroException("存貨不足");
		}
		
		//修改數量
		cartDto.getItems().get(index).setQty(newQty);
		//修改總額
		cartDto.getItems().get(index).setItemTotal();
		
		int tmpCartTotal =0;
		
		List<CartItemBean> items= cartDto.getItems();
		
		tmpCartTotal = items.stream().mapToInt((item)->item.getItemTotal()).reduce(0,(a,b)->a+b);
		
		cartDto.setCartTotal(tmpCartTotal);
		
		
		return "gewei/cartOutcome";
	}
	
	@RequestMapping(path = "/shop/clearCart",method = RequestMethod.POST)
	private String clearCart(@ModelAttribute("cartDto") CartBean cartDto) {
		System.out.println("clearCart=============");
		
		cartDto.setItems(new ArrayList<CartItemBean>());
		return "gewei/cartOutcome";
	}
	
	@PostMapping(path="/shop/checkoutAndWriteToDb")
	private String checkoutAndWriteToDataBase(
			@ModelAttribute("cartDto")CartBean cartDto,Model model) {
		
		DateTransformer dtf = new DateTransformer();
		cartDto.setTradeDate(dtf.newStringDate());
		cartDto.setOrderState();
		
		cartDto.setItemCartId();
		List<CartItemBean> items = cartDto.getItems();
		
		cartService.insert(cartDto);
		items.forEach( item ->{
			int prodId = item.getProduct().getProdId();
			
			Product product = pService.findById(prodId);
			//cartItemDao.insertIntoTable(item);
			productSrrvice.updateProdStock(prodId, productSrrvice.getProdStock(prodId), item.getQty());
			if(product.getProductDetail() == null) {
				ProductDetail productDetail = new ProductDetail();
				productDetail.setProduct(product);
				productDetail.setSales(item.getQty());
				productDetaulRepo.save(productDetail);
				
			}else if (product.getProductDetail() != null) {
				ProductDetail productDetail = product.getProductDetail();
				int originalSale = productDetail.getSales();
				originalSale += item.getQty();
				productDetail.setSales(originalSale);
				pService.update(product);
			}
			});
		
		//for mail
		//cartService.sendEmail(cartDto);
		
		return "gewei/CreateOrder";
		
	}
	
	@GetMapping("/shop/shoppingList")
	private String toCart() {
		
		return "gewei/cartOutcome";
	}
	
	//below is apply 
	@GetMapping("/shop/allcoupon")
	private @ResponseBody List<CouponBean> fetchAllCouponForUser(){
		return couponService.getInTImeCoupon();
	}
	
	@GetMapping("/shop/getcoupon")
	private String toCoupon() {
		return "gewei/applycoupon";
	}
	
	@PostMapping("/shop/applycoupon")
	private @ResponseBody List applyCoupon(@RequestBody int[] couponIds){
		
		boolean canApply;
		
		List returnList = null;
		
		List<CouponBean> list = new LinkedList<CouponBean>();
		
		if(couponIds.length == 0) {
			canApply = false;
		}
		
		if(couponIds.length == 1) {
			list.add(couponService.findById(couponIds[0]));
			returnList = new ArrayList(list);
			returnList.add(true);
			
			return returnList;
		}
		
		//將所有元素放置list
		
		
		for(int i : couponIds) {
			list.add(couponService.findById(i));
		}
		
		List<CouponBean> notConCou = couponService.findNotConcurrentCoupon(list);
		
		if(notConCou.isEmpty()) {
			canApply = true;
		}else {
			canApply = false;
			
		}
		
		List<CouponBean> conCou = couponService.findConcurrentCoupon(list);
		
		if(canApply) {
			
			returnList = new ArrayList(conCou);
			returnList.add(true);
			
		}else if(canApply == false){
			
			returnList = new ArrayList(notConCou);
			returnList.add(false);
		}
		
		return returnList;
	}
	
	@PostMapping("/shop/applysuccesscoupon")
	private @ResponseBody Integer processApplyCoupon(HttpServletRequest request ,@RequestBody List<CouponBean> coupons) {
		
		
		HttpSession httpSession = request.getSession(true);
		CartBean cartSession = (CartBean) httpSession.getAttribute("cartDto");
		System.out.println("目前購物車總金額為");
		System.out.println(cartSession.getCartTotal());
		
		Integer discountValue = couponService.applyCouponToCart(coupons, cartSession);
		System.out.println(discountValue);
		
		
		return discountValue;
	}
	
	@PostMapping(path="/shop/couponcheckout")
	private String checkoutAndWriteToDataBaseWithCoupon(
			@ModelAttribute("cartDto")CartBean cartDto ,@RequestParam("discountedTotal") Integer newTotal,@RequestParam("usedcouponsid")List<Integer> usedcouponsid ,Model model) {
		
		//多對多關係
		usedcouponsid.forEach( couponid-> {
			cartDto.addCoupon(couponService.findById(couponid));
		});
		
		DateTransformer dtf = new DateTransformer();
		cartDto.setTradeDate(dtf.newStringDate());
		cartDto.setOrderState();
		
		cartDto.setItemCartId();
		List<CartItemBean> items = cartDto.getItems();
		cartDto.setTotal(newTotal);
		cartService.insert(cartDto);
		items.forEach( item ->{
			int prodId = item.getProduct().getProdId();
			
			Product product = pService.findById(prodId);
			//cartItemDao.insertIntoTable(item);
			productSrrvice.updateProdStock(prodId, productSrrvice.getProdStock(prodId), item.getQty());
			if(product.getProductDetail() == null) {
				ProductDetail productDetail = new ProductDetail();
				productDetail.setProduct(product);
				productDetail.setSales(item.getQty());
				productDetaulRepo.save(productDetail);
				
			}else if (product.getProductDetail() != null) {
				ProductDetail productDetail = product.getProductDetail();
				int originalSale = productDetail.getSales();
				originalSale += item.getQty();
				productDetail.setSales(originalSale);
				pService.update(product);
			}
			});
		
		
		//for mail
		cartService.sendEmail(cartDto);
		
		model.addAttribute("coupons", cartDto.getCoupons());
		
		return "gewei/CreateOrder";
		
	}
	
	@Autowired GeweiGreenService greenService;
	
	@PostMapping("/shop/greenNocouponcheckout")
	public ResponseEntity<?> greenCheckout(@ModelAttribute("cartDto")CartBean cartDto){
		
		String form = greenService.genAioCheckOutAll(cartDto, false);
		
		return new ResponseEntity<>(form,HttpStatus.OK);
	}
	
	@PostMapping("/shop/greenCouponCheckout")
	public ResponseEntity<?> greenNoCouponCheckout(@ModelAttribute("cartDto")CartBean cartDto,@RequestParam("discountedTotal") Integer newTotal,@RequestParam("usedcouponsid")List<Integer> usedcouponsid ,Model model){
		
		cartDto.setTotal(newTotal);
		String form = greenService.genAioCheckOutAll(cartDto, true);
//		model.addAttribute("discountedTotal", newTotal);
		model.addAttribute("usedcouponsid", usedcouponsid);
		
		return new ResponseEntity<>(form,HttpStatus.OK);
	}
	
	@PostMapping("/shop/greencoupon")
	private String greenCoupon(@ModelAttribute("usedcouponsid")List<Integer> usedcouponsid ,@ModelAttribute("cartDto")CartBean cartDto ,Model model) {
		
		
		//多對多關係
		usedcouponsid.forEach( couponid-> {
			cartDto.addCoupon(couponService.findById(couponid));
		});
		
		DateTransformer dtf = new DateTransformer();
		cartDto.setTradeDate(dtf.newStringDate());
		cartDto.setOrderState();
		
		cartDto.setItemCartId();
		List<CartItemBean> items = cartDto.getItems();

		cartService.insert(cartDto);
		items.forEach( item ->{
			int prodId = item.getProduct().getProdId();
			
			Product product = pService.findById(prodId);
			//cartItemDao.insertIntoTable(item);
			productSrrvice.updateProdStock(prodId, productSrrvice.getProdStock(prodId), item.getQty());
			if(product.getProductDetail() == null) {
				ProductDetail productDetail = new ProductDetail();
				productDetail.setProduct(product);
				productDetail.setSales(item.getQty());
				productDetaulRepo.save(productDetail);
				
			}else if (product.getProductDetail() != null) {
				ProductDetail productDetail = product.getProductDetail();
				int originalSale = productDetail.getSales();
				originalSale += item.getQty();
				productDetail.setSales(originalSale);
				pService.update(product);
			}
			});
		
		
		//for mail
		cartService.sendEmail(cartDto);
		
		model.addAttribute("coupons", cartDto.getCoupons());
		
		return "gewei/CreateOrder";
	}
	
	@GetMapping("/shop/myorder")
	private String touserhistory(Model model,HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		User loginUser = (User)httpSession.getAttribute("sessionuser");
		if(loginUser == null) {
			throw new DineroException("您需登入才可進行後續操作");
		}
		Integer userId = loginUser.getUserId();
		List<CartBean> cart = cartService.selectOrdByCustId(userId);
		Collections.reverse(cart);
		model.addAttribute("carts",cart);
		
		return "gewei/Userhistoryorder";
	}
	
	@PostMapping("/shop/applyrefund")
	private String applyRefund(@RequestParam("cartId") int cartId,Model model,HttpServletRequest request) { 
		
		cartService.makeRefund(cartId);
		HttpSession httpSession = request.getSession(true);
		User loginUser = (User)httpSession.getAttribute("sessionuser");
		if(loginUser == null) {
			throw new DineroException("您需登入才可進行後續操作");
		}
		Integer userId = loginUser.getUserId();
		List<CartBean> cart = cartService.selectOrdByCustId(userId);
		Collections.reverse(cart);
		model.addAttribute("carts",cart);
		
		
		return "gewei/Userhistoryorder";
	}

}
