package com.dinero.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity@Table(name = "RESPONSE")
public class ResponseBean {
	
	@Id @Column(name = "RID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rid;
	
	@Column(name = "RCONTENT")
	private String rcontent;
	
	@Column(name = "RMODIFYTIME")
	private Timestamp rmodifytime;
	
//	@Column(name = "MESSAGEID")
//	private int messageid;
	
	@Column(name = "USERID")
	private int userid;
	
	//留言對到Message
	@ManyToOne(fetch = FetchType.LAZY,cascade =CascadeType.ALL)
	@JoinColumn(name = "messageid")
	@JsonIgnore
	private MessageBean message;
	
	@Transient //
	private int messageId;
	
	public MessageBean getMessage() {
		return message;
	}
	//要多加 this.messageId = message.getMessageId();對應到該message id
	public void setMessage(MessageBean message) {
		this.message = message;
		this.messageId = message.getMessageId();
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Timestamp getRmodifytime() {
		return rmodifytime;
	}
	public void setRmodifytime(Timestamp rmodifytime) {
		this.rmodifytime = rmodifytime;
	}
	
	// messageId getter/setter
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getUserid() {
		return userid;
	}
}
