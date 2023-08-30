package com.dinero.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name="activity") // Table name 建議寫小寫
@Component
public class Activity {
	
	@Id @Column(name = "ACTID") // Column name 不能寫駝峰式
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int actId;
	
	@Column(name = "ACTTYPE")
	private String actType;
	
	@Column(name="ACTNAME")
	private String actName;
	
	@Column(name = "ACTCONTENT")
	private String actContent;
	
	@Column(name = "MEMBERREMAIN")
	private String memberRemain;
	
	@Column(name = "ACTIMG")
	private String actImg;
	
	@Column(name = "IMGBASE64")
	private String imgBase64;
	
	@Column(name = "ENDDATE")
	private String endDate;
	
	public Activity() {
	}

	public Activity(String actType, String actName, String actContent, String memberRemain, String actImg, String imgBase64, String endDate) {
		this.actType = actType;
		this.actName = actName;
		this.actContent = actContent;
		this.memberRemain = memberRemain;
		this.imgBase64 = imgBase64;
		this.actImg = actImg;
		this.endDate = endDate;
	}

	// Generate Getters and Setters
	public int getActId() {
		return actId;
	}

	public void setActId(int actId) {
		this.actId = actId;
	}
	
	public String getActType() {
		return actType;
	}
	
	public void setActType(String actType) {
		this.actType = actType;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActContent() {
		return actContent;
	}

	public void setActContent(String actContent) {
		this.actContent = actContent;
	}

	public String getMemberRemain() {
		return memberRemain;
	}

	public void setMemberRemain(String memberRemain) {
		this.memberRemain = memberRemain;
	}
	
	public String getImgBase64() {
		return imgBase64;
	}

	public void setImgBase64(String imgBase64) {
		this.imgBase64 = imgBase64;
	}
	
	public String getActImg() {
		return actImg;
	}
	
	public void setActImg(String actImg) {
		this.actImg = actImg;
	}
	
	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}