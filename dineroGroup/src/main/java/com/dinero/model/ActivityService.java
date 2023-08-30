package com.dinero.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dinero.exception.ActNotFoundException;
import com.dinero.model.Activity;

@Service
@Transactional
public class ActivityService {
	@Autowired
	private ActivityRepository repo;
	
	public List<Activity> findAll(){
		return repo.findAll();
	}

	public Activity insert(Activity aBean) { //dinero.model.Activity.java => Bean  // aBean 自己取名
		return repo.save(aBean);
	}
	
	public void delete(int actId) {
		repo.deleteById(actId);
	}

	public Activity update(Activity aBean) {
		return repo.save(aBean);
	}
//	public void update(Act aBean) {
//	 repo.save(aBean);
//}
	
	public Activity findById(int actId) { // update 需要根據 findById 來做更新
		Optional<Activity> opt = repo.findById(actId);
		if(opt.isPresent()) {
	          return opt.get();
	    } else {
	    	  throw new ActNotFoundException("Activity with Id : "+actId+" Not Found");
	    } 

	}

	public List<Activity> findByName(String keyword) {
		 return repo.findByActNameLike(keyword);
	}

}