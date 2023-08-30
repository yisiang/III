package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Integer> {
	

	@Query(value="Select TOP 3 * from productsale order by sales desc",nativeQuery=true)
	public List<ProductDetail> findhot();
}
