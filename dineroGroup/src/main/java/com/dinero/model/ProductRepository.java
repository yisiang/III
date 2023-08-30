package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(value = "from Product where prodName like concat('%',?1,'%')")
	public List<Product> findProducts(String name);
	
	@Query(value = "from Product where category=?1 and petkind=?2")
	public List<Product> findByCateKind(String pcategory,String petkind);
	
	@Query(value = "Select TOP 4 * from Product where category=?1 and petkind=?2",nativeQuery = true)
	public List<Product> findBySuggest(String pcategory, String petkind);
}
