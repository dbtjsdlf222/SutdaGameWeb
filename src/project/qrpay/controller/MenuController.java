package project.qrpay.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.qrpay.service.MenuService;
import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("store/menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping("upload")
	public String insertAction(MenuVO menuVO, @RequestParam("img") MultipartFile file,HttpServletRequest request,HttpSession session) {
	        
	        UUID uid = UUID.randomUUID();
	        String savedName = uid.toString();
	        
	        try {
    		    String root_path = request.getSession().getServletContext().getRealPath("/");  
    		    String attach_path = "/upload_img/menu/";
    		    String fileType = "."+file.getOriginalFilename().split("[.]")[1];
    		    String imgName = root_path + attach_path + savedName + fileType;
    		    File f = new File(imgName);
    		    file.transferTo(f);
    		    
    		    System.out.println(imgName);
    		    
    		    menuVO.setStoreNo(((OwnerVO)session.getAttribute("loginInfo")).getNo());
    		    menuVO.setImg(imgName);
    		    
    		    menuService.addMenu(menuVO);
    		    
    		  } catch (Exception e) {
    		   e.printStackTrace();
    		  }  
			return savedName;
	} //insert();
	
	@RequestMapping("add")
	public String addMenu() {
		return "storepage/menuAdd";
	} //update();
	
	@RequestMapping("updateAction")
	public String updateAction(@RequestParam Map<String,String> map) {
		
		return "";
	} //update();
	
	@RequestMapping("deleteAction")
	public String deleteAction(@RequestParam Map<String,String> map) {
		
		return "";
	} //delete();
	
} //MenuController();