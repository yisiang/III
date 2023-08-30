package com.dinero.model;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import ecpay.payment.integration.domain.DoActionObj;

@Service
@Transactional
public class CartService implements ICartService{
	
	@Autowired
	private ICartDao dao ;
	
	//for mail
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public CartBean insert(CartBean cBean) {
		
		return dao.insert(cBean);
	}


	@Override
	public List<CartBean> selectAll() {
		
		return dao.selectAll();
	}

	@Override
	public CartBean updateStatus(int id, OrderStatus status) {
	
		return dao.updateStatus(id, status);
	}

	@Override
	public boolean delete(int id) {
		
		return dao.delete(id);
	}

	@Override
	public CartBean updateShipment(int id) {
		
		return dao.updateShipment(id);
	}

	@Override
	public CartBean selectByid(int id) {
		
		return dao.selectByid(id);
	}

	@Override
	public List<CartBean> advancedSelect(String cartIdParam, String custIdParam, String minStr, String maxStr,
			String minDateStr, String maxDateStr) {
		return dao.advancedSelect(cartIdParam, custIdParam, minStr, maxStr, minDateStr, maxDateStr);
	}

	@Override
	public List<CartBean> selectOrdByCustId(int custId) {
		
		return dao.selectOrdByCustId(custId);
	}

	@Override
	public CartBean selectByCartId(int cartId) {
		
		return dao.selectByCartId(cartId);
	}

	@Override
	public List<CartBean> selectByDate(String minDate, String maxDate) {
		
		return dao.selectByDate(minDate, maxDate);
	}

	@Override
	public List<CartBean> selectByTotal(String minStr, String maxStr) {
		
		return dao.selectByTotal(minStr, maxStr);
	}
	
	@Autowired
	IUserService userService;
	
	public void sendEmail(CartBean cart) {
		
		String from = "eeit39suwa68@outlook.com";
		String to ="doggg789456@gmail.com";
		String src ="C:\\hibernateWorkSpace\\dineroSpringBoot\\src\\main\\resources\\static\\gewei\\mothersday.png";
		
		//獲取顧客資料
		//cart.getCustId();
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true);
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject("您在dinero的訂單成功訂購");
			
			String htmlContent = "<html><body><p>顧客&nbsp&nbsp"+userService.getUser(cart.getCustId()).getName()+"您好</p>"
					+ "<p>您於"+cart.getTradeDate()+"在dinero的購買成功</p>"
					+ "<table border='1'>"
					+"<tr><th>訂單編號:</th><th colspan='3'>"+cart.getCartId()+"</th></tr>"
					+"<tr><th>商品名稱</th><th>商品價格</th><th>商品數量</th><th>單項總額</th></tr>";
			//加入訂單明細
			for(CartItemBean item : cart.getItems()) {
				String htmlOfItem ="<tr><td>"+item.getProduct().getProdName()+"</td>"
								  	+"<td>"+item.getPrice()+"</td>"
								  	+"<td>"+item.getQty()+"</td>"
								  	+"<td>"+item.getItemTotal()+"</td></tr>";
				htmlContent += htmlOfItem;
				}
			//本次是否有套用優惠券?
			boolean useCouponOrNot = false;
			
			if(!(cart.getCoupons() == null)) {
				useCouponOrNot = true;
				htmlContent += "<tr><td colspan='3'>優惠後總價</td><td>"+cart.getCartTotal()+"</td></tr>";
			}else if (cart.getCoupons() == null) {
				useCouponOrNot = false;
				htmlContent += "<tr><td colspan='3'>此次消費金額</td><td>\"+cart.getCartTotal()+\"</td></tr>";
			}
			htmlContent	+="</table>";
			
			if(useCouponOrNot) {
				//<th>折扣類型</th><th>折扣目標</th>
				htmlContent += "<p>此是套用的優惠券為</p><table border='1'><tr><th>名稱</th><th>折扣額度</th><th>折扣單位</th></tr>";
				
				for(CouponBean coupon : cart.getCoupons()) {
					String htmlOfCoupon = "<tr><td>"+coupon.getCouponName()+"</td>"
						  						+"<td>"+coupon.getDiscountValue()+"</td>"
						  						+"<td>"+coupon.getDiscountUnit()+"</td></tr>";
						  					
					htmlContent += htmlOfCoupon;
				}
				
				htmlContent	+="</table>";
			}
			
			
			htmlContent +="</body></html>";
			
			helper.setText(htmlContent,true);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	public void makeRefund(int cartId) {
		dao.makeRefund(cartId);
	}


	@Override
	public void acceptRefund(int cartId) {
		
		dao.acceptRefund(cartId);
	}


	@Override
	public void rejectRefund(int cartId) {
		dao.rejectRefund(cartId);
	}


	@Override
	public void shipOrd(int cartId) {
		dao.shipOrd(cartId);
		
	}
}
