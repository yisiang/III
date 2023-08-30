package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.JpaRepositoryConfigExtension;
import org.springframework.stereotype.Repository;


public interface ResponseRepository extends JpaRepository<ResponseBean, Integer>{

//	public List<ResponseBean> findByResponseId(int id);
	
	
	//
	@Query("select r from ResponseBean r where r.message.messageId = :messageId and r.userid = :userId")
	List<ResponseBean> findUserResponsesOfMessage(int userId, int messageId);
}
