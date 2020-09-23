package project.qrpay.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.qrpay.service.MenuService;
import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("store/menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String insertAction(MenuVO menuVO, Model model, @RequestParam("imgFile") MultipartFile file,HttpServletRequest request,HttpSession session) {
	        
			System.out.println(menuVO);
			
	        UUID uid = UUID.randomUUID();
	        String savedName = uid.toString();
	        OwnerVO loginInfo = (OwnerVO)session.getAttribute("loginInfo");
	        
	        String root_path = request.getSession().getServletContext().getRealPath("/");  
	        String attach_path = "/upload_img/menu/";
	        String fileType = "."+file.getOriginalFilename().split("[.]")[1];
		    File fileMk = new File(root_path + attach_path);
		    fileMk.mkdirs();
		    
		    String imgName = root_path + attach_path + savedName + fileType;
		    File f = new File(imgName);
		    try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		    System.out.println(imgName);
		    menuVO.setStoreNo(loginInfo.getNo());
		    menuVO.setImg(savedName + fileType);
		    menuService.addMenu(menuVO);
	        
	        model.addAttribute("menuList",menuService.selectAllMenu(loginInfo.getNo()));
	        
			return "storepage/menuView";
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