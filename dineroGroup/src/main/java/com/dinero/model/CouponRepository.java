package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CouponRepository extends JpaRepository<CouponBean, Integer>{
	
	@Query("select c from CouponBean c where (c.validFrom between :validFrom and :validUntil) or (c.validUntil between :validFrom and  :validUntil) or ( (c.validFrom > :validFrom) and c.validUntil < :validUntil)")
	List<CouponBean> findOverLappCoupon(@Param("validFrom") String valifFrom ,@Param("validUntil") String validUntil);
	
	@Query("select DISTINCT(c.couponCode) from CouponBean c where c.couponCode = :input")
	String getRepeatedCouponCode(@Param("input") String inputString);
	
	@Query("Select c from CouponBean c where ( c.validFrom < :now ) and (c.validUntil > :now) ")
	List<CouponBean> getInTimeCoupon(@Param("now") String now);
	
}
