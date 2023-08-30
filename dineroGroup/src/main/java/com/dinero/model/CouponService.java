package com.dinero.model;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.OptionalInt;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.dinero.util.DateTransformer;

import freemarker.core.ParseException;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponRepository couponRepo;

	public CouponBean insert(CouponBean coupon) {
		//coupon.setCouponId(0);
		return couponRepo.save(coupon);
	}
	
	public void deleteById(Integer id) {
		couponRepo.deleteById(id);
	}

	public String getRepeatedCouponCode(String input) {

		String repeatedCouponCode = couponRepo.getRepeatedCouponCode(input);
		return repeatedCouponCode;
	}

	public List<CouponBean> findOverLappCoupon(String valifFrom, String validUntil) {

		return couponRepo.findOverLappCoupon(valifFrom, validUntil);
	};

	public List<CouponBean> findAll() {

		return couponRepo.findAll();
	}

	public List<CouponBean> findNotConcurrentCoupon(List<CouponBean> selectedCoupon) {

		List<CouponBean> test = selectedCoupon.stream().filter(c -> !c.isConcurrency()).collect(Collectors.toList());
		return test;
	}

	public CouponBean findById(int id) {
		return couponRepo.findById(id).get();
	}

	public List<CouponBean> findConcurrentCoupon(List<CouponBean> selectedCoupon) {

		List<CouponBean> test = selectedCoupon.stream().filter(c -> c.isConcurrency()).collect(Collectors.toList());
		return test;
	}

	public Integer applyCouponToCart(List<CouponBean> coupons, CartBean cart) {

		Integer maximumDiscountAmount = coupons.stream().mapToInt(CouponBean::getMaximumDiscountAmount).max()
				.getAsInt();

		float discountMultiplier = 1;

		DiscountType tmpDis;

		Iterator<CouponBean> couponIterator = coupons.iterator();
		Iterator<CartItemBean> itemIterator = cart.getItems().iterator();

		//
		int tmpDiscountTotal = 0;

		while (couponIterator.hasNext()) {
			// coupon 相關
			// 某coupon
			CouponBean thisCoupon = couponIterator.next();
			String thisUnit = thisCoupon.getDiscountUnit();
			tmpDis = thisCoupon.getDiscountType();
			String aimedObject = thisCoupon.getDiscountedClass();

			if ("%".equals(thisUnit)) {
				// 乘數
				discountMultiplier = 0.01F * thisCoupon.getDiscountValue();
				
				applyCuponToItem(tmpDis, aimedObject, discountMultiplier, tmpDiscountTotal, maximumDiscountAmount, cart, itemIterator);
				

			} else if ("dollar".equals(thisUnit)) {
				//固定金額折扣
				//System.out.println(" 固定金額折扣 折扣價為");
				discountMultiplier = thisCoupon.getDiscountValue();
				//System.out.println(discountMultiplier);
				
				tmpDiscountTotal = applyCuponToItem(tmpDis, aimedObject, discountMultiplier, tmpDiscountTotal, maximumDiscountAmount, cart, itemIterator);
				System.out.println("在apply完後優惠為");
				System.out.println(tmpDiscountTotal);
			}
			//round end 
			//reset multiplier
			discountMultiplier = 1;
			if (tmpDiscountTotal >= maximumDiscountAmount) {

				return maximumDiscountAmount;
			}
			//System.out.println("本輪優惠為");
			//System.out.println(tmpDiscountTotal);
		}
		//真的跑完每張
		if (tmpDiscountTotal <= maximumDiscountAmount) {

			return tmpDiscountTotal;
		}

		return maximumDiscountAmount;
	}

	public Integer addDiscountThisRound(CartItemBean nextItem, float discountMultiplier, int tmpDiscountTotal,
			int maximumDiscountAmount, CartBean cart) {
		float totalPrice = nextItem.getItemTotal();

		if (discountMultiplier < 1) {
			int discountThisRound = Math.round(discountMultiplier * totalPrice);
			tmpDiscountTotal += discountThisRound;

		} else if (discountMultiplier >= 1) {
			System.out.println("進入大於一條件");
			int discountThisRound = Math.round(discountMultiplier);
			tmpDiscountTotal += discountThisRound;
		}
		
		return tmpDiscountTotal;
	}
	
	
	public Integer applyCuponToItem(DiscountType tmpDis,String aimedObject,float discountMultiplier,int tmpDiscountTotal , int maximumDiscountAmount ,CartBean cart,Iterator<CartItemBean> itemIterator ) {
		if (DiscountType.ProductDiscount.equals(tmpDis)) {
			
			while (itemIterator.hasNext()) {

				CartItemBean nextItem = itemIterator.next();
				if (nextItem.getProduct().getProdName().equals(aimedObject)) {
				
					tmpDiscountTotal = addDiscountThisRound(nextItem, discountMultiplier, tmpDiscountTotal,maximumDiscountAmount, cart);
					
					break;
				}
			}
		}
		
		else if (DiscountType.ProductCategoryDiscount.equals(tmpDis)) {
			
			while (itemIterator.hasNext()) {
				
				CartItemBean nextItem = itemIterator.next();
				//get的東西不同
				if (nextItem.getProduct().getCategory().equals(aimedObject)) {
				tmpDiscountTotal	= addDiscountThisRound(nextItem, discountMultiplier, tmpDiscountTotal, maximumDiscountAmount, cart);
				}
			}
			
		}
		else if (DiscountType.CartDiscount.equals(tmpDis)) {
			System.out.println("進入購物車折扣");
			
			tmpDiscountTotal += discountMultiplier;
			
		}
		
		return tmpDiscountTotal;
	}
	
	//for mail 
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private freemarker.template.Configuration freemarkerConfig;
	
	public void sendMail(CouponBean coupon) {
		
		String from = "eeit39suwa68@outlook.com";
		String to ="doggg789456@gmail.com";
		String src ="C:\\hibernateWorkSpace\\dineroSpringBoot\\src\\main\\resources\\static\\gewei\\mothersday.png";
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject("dinero "+coupon.getCouponName()+" 推播通知");
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("couponName", coupon.getCouponName());
			model.put("discountValue", coupon.getDiscountValue());
			model.put("discountUnit", coupon.getDiscountUnit());
			model.put("describe", coupon.getDescribe());
			model.put("couponCode", coupon.getCouponCode());
			model.put("validUntil", coupon.getValidUntil());
			
			String templateString = FreeMarkerTemplateUtils
					.processTemplateIntoString(freemarkerConfig.getTemplate("gewei/pushcoupon.html"), model);
			helper.setText(templateString,true);
			
			FileSystemResource file = new FileSystemResource(new File(src));
			helper.addInline("couponpic", file);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<CouponBean> getInTImeCoupon(){
		return couponRepo.getInTimeCoupon(new DateTransformer().newStringDate());
	}
}
