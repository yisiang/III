package com.dinero.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="MESSAGE")
public class MessageBean {
	
	@Id @Column(name = "MESSAGEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int messageId;
	
	@Column(name = "MESSAGETITLE")
	private String messagetitle;
	
	@Column(name = "MESSAGE")
	private String message;
	
	@Column(name = "PIC")
	private String pic;
	
	@JsonIgnore
	@Column(name = "PICBASE64")
	private String picBase64;

	@JsonFormat(pattern = "yyy-MM-dd",timezone = "GMT+8") //時間格式
//	@CreatedDate // 自動創建時間
    @CreationTimestamp 
    @Column(name = "POSTTIME")
	private Timestamp posttime;
    
//	@LastModifiedDate //修改時自動創建時間
	@JsonFormat(pattern = "yyy-MM-dd",timezone = "GMT+8") //時間格式
    @UpdateTimestamp
	@Column(name = "MODIFYTIME")
	private Timestamp modifytime;
	
	@Column(name = "CATEGORY")
	private String category;
	
	@JsonIgnore
	@Column(name = "CTR") // Cost Through Rate
	private Integer ctr;
	@JsonIgnore
	@Column(name = "FAV") //Favorite
	private Integer fav;
	
	
	//加入留言OneToMany要mappedBy
	@OneToMany(fetch = FetchType.LAZY, mappedBy ="message",cascade = CascadeType.ALL)
	private List<ResponseBean> responses;
	

	public void addResponse(ResponseBean response) {
		if(responses == null) {
			responses = new ArrayList<ResponseBean>();
		}
		responses.add(response);
	}
	
	//getter setter for response
	public List<ResponseBean> getResponses() {
		return responses;
	}
	
	public void setResponses(List<ResponseBean> responses) {
		this.responses = responses;
	}
	
	
	
	
	
	//修改
	public MessageBean(int messageId, String messagetitle, String message, String pic, String picBase64, String category, int ctr ) {
		this.messageId=this.messageId;
		this.messagetitle=messagetitle;
		this.message=message;
		this.pic=pic;
		this.picBase64=picBase64;
		this.category=category;
		this.ctr=ctr;
		this.fav=fav;
	}
	//新增
	public MessageBean( String messagetitle, String message, String pic,String picBase64) {
		this.messagetitle=messagetitle;
		this.message=message;
		this.pic=pic;
		this.picBase64=picBase64;
		this.category=category;
		this.ctr=ctr;
		this.fav=fav;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getMessageId() {
		return messageId;
	}
	public String getMessagetitle() {
		return messagetitle;
	}
	
	public void setMessagetitle(String messagetitle) {
		this.messagetitle = messagetitle;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getPicBase64() {
		return picBase64;
	}
	public void setPicBase64(String picBase64) {
		this.picBase64 = picBase64;
	}

	public Timestamp getPosttime() {
		return posttime;
	}

	public void setPosttime(Timestamp posttime) {
		this.posttime = posttime;
	}

	public Timestamp getModifytime() {
		return modifytime;
	}

	public void setModifytime(Timestamp modifytime) {
		this.modifytime = modifytime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCtr() {
		return ctr;
	}
	public void setCtr(int ctr) {
		this.ctr = ctr;
	}
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	public MessageBean() {
	}
	
}
	