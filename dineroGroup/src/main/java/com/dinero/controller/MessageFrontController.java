package com.dinero.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dinero.model.IUserService;
import com.dinero.model.MessageBean;
import com.dinero.model.MessageService;
import com.dinero.model.ResponseBean;
import com.dinero.model.ResponseRepository;
import com.dinero.model.ResponseService;
import com.dinero.model.User;
import com.dinero.util.DineroException;

//@SessionAttributes({"message"})
@Controller
public class MessageFrontController {
	
	@Autowired
	private MessageService mService;
	
	@Autowired
	private ResponseService rService;
	
	@Autowired
	private IUserService userService;
	
	// find All
		@GetMapping("articles") // 路徑多一層：/user/articles
		public String processFindAllAction(Model m) {
			List<MessageBean> list = mService.findAll();
			//System.out.println("全部資料" + list);
			m.addAttribute("messages", list);
			return "userboard/userArtIndex";
		}
	
	// select By category
		@GetMapping("category") //路徑多一層：/show/category
		public String showArticlesByCategory(@RequestParam("category")String ca, Model m) {
			List<MessageBean> list = mService.showMessageByCategory(ca);
			m.addAttribute("category",list);
			System.out.println(list.get(0).getMessageId());
			System.out.println("文章分類");
//		
			return "userboard/articles";
			}
	
		//Create Article
		@GetMapping(path = "/ucreateArticle")
		public String createArticle(Model m) {
			System.out.println("create article !");
			MessageBean mBean = new MessageBean();
			//form:form表單modelAttribute="Message"要相同
			m.addAttribute("Message",mBean);
			
			return "userboard/createArticle";
		}
		
		@PostMapping(path = "/ucreateArticle")
		public String createArticles(@ModelAttribute("Message") MessageBean mBean) {
			System.out.println("使用者新增文章");
			mService.Insert(mBean);
			return "redirect:/articles";
			//return "userboard/articles";
		}
		//Update
		@PostMapping(path = "/update/article")
		public String updateArticle(@RequestParam("messsageId") int id, Model m) {
			
			MessageBean mBean = mService.findById(id);
			m.addAttribute("update",mBean);
			return "";
		}
		@PostMapping("/update/articles")
		@ResponseBody
		public String updateArticles(@ModelAttribute("update") MessageBean mBean) {
			mService.update(mBean);
			System.out.println("update article");
			return "";
			
		}
		
//		// Delete
//				@GetMapping
//				public String deleteArticle(@RequestParam("messageId")int id,MessageBean m ) {
//					System.out.println("刪除："+id);
//					mService.deleById(id);
//					return "";
//				}
		
		// Add Response
//		@GetMapping("/addResponse")
		public String addRespon(@RequestParam("messsageId") int id, Model m) {
			
			MessageBean mBean = mService.findById(id);
//			MessageBean.getResponse()
			m.addAttribute("message",mBean);
			m.addAttribute("responses",mBean.getResponses());
			m.addAttribute("response", new ResponseBean());
			
			return"";
		}
		
		public String addResponse2(@ModelAttribute("message") MessageBean messsage
					,@ModelAttribute("response") ResponseBean rBean) {
			messsage.addResponse(rBean);
			rBean.setMessage(messsage);
//			rrepo.save(rBean);
			
			return "";
		}
		
		
		@GetMapping("/addResponse/{id}")
		@ResponseBody
		public String addResponAjax(@PathVariable("id") int id,@RequestParam("responsetext")String responsetext,HttpServletRequest request) {
			User user = (User)request.getSession(true).getAttribute("sessionuser");
			if(user == null) {	
				return "false";
			}
			
			
			MessageBean mBean = mService.findById(id);
			ResponseBean r = new ResponseBean();
			r.setMessage(mBean);
			r.setRcontent(responsetext);
			r.setUserid(user.getUserId());
			r.setRmodifytime(new Timestamp(System.currentTimeMillis()));
			user.addResponses(r);
			userService.updateUser(user);
			
			return "success";
		}
		
		
}
