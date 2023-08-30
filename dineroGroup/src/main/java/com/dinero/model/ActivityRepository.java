package com.dinero.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

	@Query(value = "from Activity where actName like concat('%',?1,'%')")
	public List<Activity> findByActNameLike(String keyword);

}
