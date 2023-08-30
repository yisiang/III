package com.dinero.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dinero.model.MessageBean;
import com.dinero.model.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService mService;
	
	// find All
	@RequestMapping("/messagesIndex")
	public String processFindAllAction(Model m) {
		List<MessageBean> list = mService.findAll();
		System.out.println("全部資料" + list);
		m.addAttribute("messages", list);
		return "messageboard/messageIndex_test";
	}
	// select By category
			@GetMapping("categoryMng") //路徑多一層：/show/category
			public String showArticlesByCategory(@RequestParam(name="category",required = false)String ca, Model m) {
				if(!"".equals(ca)) {
					List<MessageBean> list = mService.showMessageByCategory(ca);
					m.addAttribute("messages",list);
					System.out.println(list.get(0).getMessageId());
					System.out.println("文章分類");	
					return "messageboard/messageIndex_test";
				}
				System.out.println("回首頁");	
				return "redirect:/messagesIndex";
				}

	// Find By Id
	@RequestMapping(path = "/message")
	public String showMessage(@RequestParam(name = "messageId", required = false) Integer id, Model m) {
		System.out.println("Read message---------" + id);
		if (id != null) {
			MessageBean list = mService.findById(id);
			
			m.addAttribute("messages", list);
			System.out.println("留言板" + m);
			return "messageboard/messageIndex_test";
		}
		return "redirect:/messagesIndex";
	}

	// Insert Message
	// 把m.addAttribute導到/createMessage頁面，取得form:form表單資料
	@RequestMapping(path = "/messageInsert", method = RequestMethod.GET)
	public String insertMessage(Model m) {
		System.out.println("messageInsert!!!");
		MessageBean mBean = new MessageBean();
		m.addAttribute("Message", mBean);

		return "messageboard/createMessage_test";
	}
	//再導回來用@ModelAttribute MessageBean m把參數映射到特定欄位，透過service做事，最後回到messageIndex
	@RequestMapping(path = "/messageInsert", method = RequestMethod.POST)
	public String insertMessage2(@ModelAttribute MessageBean m, @RequestParam("messagetitle") String messagetitle,
			@RequestParam("message") String message, @RequestParam("pic") String pic, @RequestParam("picBase64") String picBase64){
		System.out.println(m.getCategory());
		mService.Insert(m);
		return "redirect:/messagesIndex";
	}
	// Update Message
	@GetMapping(path = "/messageUpdate")
	public String showupdateMessage(@RequestParam("messageId") int id,Model m) {
			
			MessageBean msgb= mService.findById(id);
//		system.out.println(messageId+message+message);
			m.addAttribute("updatelist",msgb);
	
			return "messageboard/updateMessage_test";
	}
	@PostMapping(path = "/messageUpdate")
	public String updateMessage(
			@ModelAttribute("updatelist") MessageBean mBean) {
//		System.out.println("update post");
		mService.update(mBean);
		System.out.println("update 2");
		return "redirect:/messagesIndex";
		
	}
	// Delete
		@RequestMapping(path = "/messageDelete")
		public String deleteMessage(@RequestParam("messageId")int id,MessageBean m ) {
			System.out.println("刪除："+id);
			mService.deleById(id);
			return "redirect:/messagesIndex";
		}
		
//		 @RequestMapping("/count")
//		    @ResponseBody
//		    public String number(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){
//		        try{  //把sessionId記錄在瀏覽器
//		            Cookie c = new Cookie("JSESSIONID", URLEncoder.encode(httpServletRequest.getSession().getId(), "utf-8"));
//		            c.setPath("/");
//		            //先設定cookie有效期為2天，不用擔心，session不會儲存2天
//		            c.setMaxAge( 48*60 * 60);
//		            httpServletResponse.addCookie(c);
//		        }catch (Exception e){
//		            e.printStackTrace();
//		        }
//
//		        HttpSession session = httpServletRequest.getSession();
//		        Object count=session.getServletContext().getAttribute("count");
//		        return "count : "+count;
//		    }
}


