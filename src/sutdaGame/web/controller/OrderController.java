package sutdaGame.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sutdaGame.web.service.MainService;

@Controller @RequestMapping("main")
public class OrderController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/")
	public String main() {
		return "mainpage/main";   
	} 
	
} //class 
