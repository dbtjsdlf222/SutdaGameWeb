package project.qrpay.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller @RequestMapping("store/menu")
public class MenuController {
	
	@RequestMapping("upload")
	public String insertAction(@RequestParam Map<String,String> map, @RequestParam("img") MultipartFile file,HttpServletRequest request) {
		  	System.out.println("파일 이름 : " + file.getOriginalFilename());
	        System.out.println("파일 크기 : " + file.getSize());
	        
	        UUID uid = UUID.randomUUID();
	        String savedName = uid.toString();
	        
	        try {
	        	File Folder = new File("재범업.txt");
    		    Folder.mkdir(); //폴더 생성합니다.
    		    
    		    String root_path = request.getSession().getServletContext().getRealPath("/");  

    		    String attach_path = "/upload/menu";
    		    String filename = file.getOriginalFilename();

    		    File f = new File(root_path + attach_path + filename);
    		   file.transferTo(f);
    		  } catch (Exception e) {
    		   System.out.println(e.getMessage());
    		  }  
    		    
    		    
//				File target = new File("img/menu");
//				FileCopyUtils.copy(file.getBytes(), target);
//			}
//	        catch (IOException e) {
//				e.printStackTrace();
//			}
			return savedName;
//	        
	 
//		return "";
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