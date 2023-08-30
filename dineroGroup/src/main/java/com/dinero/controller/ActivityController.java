package com.dinero.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dinero.model.Activity;
import com.dinero.model.ActivityService;

@Controller
@RequestMapping("/activities")
public class ActivityController {
	
	@Autowired
	private ActivityService aService;
	
	@GetMapping("/activity.info")  //activities
	public String findAll(Model model) {
		
		
		model.addAttribute("activityList", aService.findAll());
//		List<Act> list = aService.findAll();
//		System.out.println(list.get(0).getActName());
		
//		return "ActJSP/adminIndex"; 
		return "ActJSP/adminIndex"; 
	}
	
	
	@GetMapping("/activity.insert1")
    public String insert1(Model model) {
		Activity activity = new Activity(); // 等於 不寫
		model.addAttribute("commandCreate", activity); // 等於 然後只寫 model.addAttribute("command",new Activity()); //dinero.model.Act.java => Bean
		System.out.println("===============nCreate測試===============");
        return "ActJSP/adminCreate";
	}
	
	@PostMapping("/activity.insert") //form:form表單 可以用post
	public String insert( @ModelAttribute("commandCreate") Activity activity, @RequestParam("imgUploadBase") String actImg) { // public String insert( @ModelAttribute("commandCreate") Activity activity) {
		
//		if (bindingResult.hasErrors()) {
//	        //errors processing
//	    }  
		
		activity.setImgBase64(actImg); // 為上面 ModelAttribute 的 Activity 型別的 activity
        aService.insert(activity); // 為上面 ModelAttribute 的 Activity 型別的 activity
        System.out.println("test====新增=====" + " " +activity.getActId() +" "+ activity.getActType() +" " + activity.getActName() +" "+ activity.getActContent() +" "+ activity.getMemberRemain() +" "+ activity.getActImg() +" "+ activity.getImgBase64() +" "+ activity.getEndDate());
        
        return "redirect:/activities/activity.info";
        
//        //用下面的，(@ModelAttribute("activity") Activity activity, BindingResult bindingResult, Model model) 後面還要多寫 Model model
//        model.addAttribute("activity", activity);
//        return "redirect:/activities/activity.info";
        
	}
	
	
	@GetMapping("/activity.delete/{actId}")
	public String delete(@PathVariable("actId") int actId) {
		System.out.println("刪除的活動編號是=========" + actId);

		aService.delete(actId);
		return "redirect:/activities/activity.info";
	}
	
	
	@GetMapping("/activity.update1/{actId}")
    public String update( @PathVariable("actId") int actId, Model model) {
		System.out.println("\n"+"update test1\n");
		
		Activity activity = aService.findById(actId);
		model.addAttribute("commandUpdate", activity);
		
		return "ActJSP/adminUpdate";
	 } 
	
	//有給id是新增，沒給id是修改
	@PostMapping("/activity.update")
	public String update1(@ModelAttribute("commandUpdate") Activity activity, @RequestParam("imgUploadBase")String actImg) {
		
		System.out.println(activity.getActId());
		System.out.println("\n"+"test====修改，調用service方法之前=====");
		System.out.println("\n"+"test====修改，調用service方法之後=====" + " " +activity.getActId() +" "+ activity.getActType() +" " + activity.getActName() +" "+ activity.getActContent() +" "+ activity.getMemberRemain() +" "+ activity.getActImg() +" "+ activity.getImgBase64() +" "+ activity.getEndDate());
		
		activity.setImgBase64(actImg);
		aService.update(activity);
		
		return "redirect:/activities/activity.info";
	}
	
	
//	@GetMapping("/activity.find") //這個沒有用到
//	public String find(Model model, @RequestParam("actName") String keyword) {	
//		System.out.println("ID" + keyword);
//		
//		List<Activity> activity = aService.findByName(keyword);
//		model.addAttribute("activityList", activity);
//		return "ActJSP/adminFind";
//	}
	
	@GetMapping("/activity.findMember/1")  //activities
	public String findMember() {	
	
		return "ActJSP/adminFindMemberActId1";
	}
	
}	
	
///////////////////////////////////////////////////////////我是分隔線///////////////////////////////////////////////////////////
	
//	//上傳圖片的別種寫法

//	@ResponseBody //老師的檔案是 @RestController，而 @RestController =  @Controller + @ResponseBody
//	@GetMapping(path = "/activity.uploadImage", produces = MediaType.IMAGE_JPEG_VALUE)
//	public byte[] processClassPathResourceAction() throws IOException {
//		Resource resource = new ClassPathResource("static/ActImage/image2.jpg");
//		
//		File file = resource.getFile();
//		System.out.println(file.getName() + "\n" + file.getPath() + "\n" + file.length());
//		
//		InputStream is1 = resource.getInputStream();
//		return IOUtils.toByteArray(is1);
//	}
	
//	@GetMapping("/activity.uploadImage")
//	public String processImageUpload(Activity activity, @RequestParam("img") MultipartFile files, @RequestParam("activityId") int actId, HttpServletRequest request)
//		throws IllegalStateException, IOException {  // 要給id才會新增(見java的api)
//			
//			String fileName = files.getOriginalFilename(); //對應 MultipartFile files 的 files
//			String saveFileDir = "C:/dinero/dineroSpringBoot/src/main/resources/static/ActImgSave/";
//	
//			File saveDirFile = new File(saveFileDir);
//			saveDirFile.mkdirs(); //mkdirs 建立目錄
//	
//			String saveFilePath = saveFileDir + fileName;
//			File saveFile = new File(saveFilePath); // saveFile 對應下方的 public void saveFile 
//			files.transferTo(saveFile); //對應 MultipartFile files 的 files
//			if (fileName != null && fileName.length() != 0) {
//				saveFile(saveFilePath, activity, fileName);
//		}
//
//		return "redirect:/activities/activity.info";
//	}
//
//	public void saveFile(String actImg, Activity activity, String saveFilePath) {
//		try {
//			FileInputStream is1 = new FileInputStream(saveFilePath);
//			byte[] b = new byte[is1.available()];
//			is1.read(b);
//			is1.close();
//			activity.setActImg(actImg); // actImg 是 String actImg
//			aService.insert(activity); //對應 ActivityService.java 中的 public Activity insert(Activity aBean) {
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	
//	}
