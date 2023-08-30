package com.dinero.model;

import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class MessageService {
	@Autowired
	private MessageRepository mRepo;
	
	public List<MessageBean> findAll() {
		System.out.println("全部資料："+(mRepo.findAll()));
		return mRepo.findAll();
	}
	public MessageBean findById(int messageId) {
		 MessageBean optional = mRepo.findByMessageId(messageId);
		System.out.println("指定資料："+optional);
			return optional;
		}
	
	public void deleById(Integer messageId) {
		mRepo.deleteById(messageId);
	}
	public MessageBean update(MessageBean m){
		return mRepo.save(m);
		
	}
	public MessageBean Insert(MessageBean m) {
		return mRepo.save(m);
	}
	public List<MessageBean> showMessageByCategory(String ca){
		return mRepo.findByCategory(ca);
	}
	//統計瀏覽數量
//	@WebListener
//	public class OnLineCount implements HttpSessionListener {
//	    public int count=0;//記錄session的數量
//	    //監聽session的建立,synchronized 防併發bug
//	    public synchronized void sessionCreated(HttpSessionEvent arg0) {
//	        System.out.println("【HttpSessionListener監聽器】count++  增加");
//	        count++;
//	        arg0.getSession().getServletContext().setAttribute("count", count);
//
//	    }
//	    @Override
//	    public synchronized void sessionDestroyed(HttpSessionEvent arg0) {//監聽session的撤銷
//	        System.out.println("【HttpSessionListener監聽器】count--  減少");
//	        count--;
//	        arg0.getSession().getServletContext().setAttribute("count", count);
//	    }
//	}
	
//	public UserAccess (int messageId) {
//		MessageBean message = new MessageBean();
//		message.setFav(messageId);
//	
//		mRepo.
//	}
	
	
//	}

}
