package project.qrpay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@RequestMapping("/")
	public String main() {
		return "customerpage/customerView";
	} //main();
	
	@RequestMapping("header")
	public String header() {
		
		return "customerpage/customerHeader";
	}
	
	@RequestMapping("category")
	public String category() {
		
		return "customerpage/customerCategory";
	}	
	
} //CustomerController();