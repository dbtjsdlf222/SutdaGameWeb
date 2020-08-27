package project.qrpay.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller @RequestMapping("store/menu")
public class MenuController {
	
	@RequestMapping("upload")
	public String insertAction(@RequestParam Map<String,String> map, @RequestParam("img") MultipartFile file) {
		  	System.out.println("파일 이름 : " + file.getOriginalFilename());
	        System.out.println("파일 크기 : " + file.getSize());
	        
	        try (FileOutputStream fos = new FileOutputStream("/image/menu" + file.getOriginalFilename());
	             InputStream is = file.getInputStream();) {
	        	int readCount = 0;
	            byte[] buffer = new byte[1024];
	            while ((readCount = is.read(buffer)) != -1) {
	                fos.write(buffer, 0, readCount);
	            }
	        } catch (Exception ex) {
	            throw new RuntimeException("file Save Error");
	        }
	 
		return "";
	} //insert();
	
	@RequestMapping("add")
	public String addMenu() {
		return "menuAdd";
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