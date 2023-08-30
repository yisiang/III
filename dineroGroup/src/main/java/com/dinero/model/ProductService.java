package com.dinero.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository productRepo;
	
	public Product insert(Product product) {
		return productRepo.save(product);
	}
	
	public Product update(Product product) {
		return productRepo.save(product);
	}
	
	public void deleteById(Integer id) {
		productRepo.deleteById(id);
	}
	
	public Product findById(Integer id) {
		Optional<Product> optional = productRepo.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public List<Product> findAll(){
		return productRepo.findAll();
	}
	
	public List<Product> findProducts(String name){
		return productRepo.findProducts(name);
	}
	
	public List<Product> findByCateKind(String pcategory,String petkind){
		return productRepo.findByCateKind(pcategory, petkind);
	}
	
	public List<Product> findBySuggest(String pcategory,String petkind){
		return productRepo.findBySuggest(pcategory, petkind);
	}
}
