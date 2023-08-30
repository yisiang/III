package com.dinero.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResponseService {
	
	@Autowired
	private ResponseRepository rRepo;

	public ResponseBean Insert(ResponseBean r) {
		return rRepo.save(r);
	}
}
