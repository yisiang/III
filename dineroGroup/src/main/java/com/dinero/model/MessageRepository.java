package com.dinero.model;

import java.util.List;
import java.util.Optional;

import javax.persistence.Id;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends JpaRepository<MessageBean, Integer>{
	
	
	
	public  MessageBean findByMessageId(int id);
	
//	public MessageBean getById(int id);
	
	
	public List<MessageBean> findByCategory(String c);
}	