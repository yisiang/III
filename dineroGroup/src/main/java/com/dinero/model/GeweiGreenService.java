package com.dinero.model;

import java.util.UUID;

import org.springframework.stereotype.Service;

import com.dinero.util.DateTransformer;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class GeweiGreenService {
	
	public static AllInOne all;
	
	public GeweiGreenService() {
		all = new AllInOne("");
	}
	
	public String genAioCheckOutAll(CartBean ord,boolean useCouponOrNot) {
		
		AioCheckOutALL obj = new AioCheckOutALL();
		
		DateTransformer dtf = new DateTransformer();
		UUID uuid = UUID.randomUUID();
		obj.setMerchantTradeNo(uuid.toString().substring(0,18).replace("-", ""));
		obj.setMerchantTradeDate(dtf.toGreenDate());
		obj.setTotalAmount(String.valueOf(ord.getCartTotal()));
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("https://3edf-114-25-229-152.ngrok.io//dinero//GreenController");
		if(useCouponOrNot) {
			obj.setOrderResultURL("http://localhost:8080/dinero/shop/greencoupon");
		}else if (useCouponOrNot == false) {
			obj.setOrderResultURL("http://localhost:8080/dinero/shop/checkoutAndWriteToDb");
		}
		
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
	
}
