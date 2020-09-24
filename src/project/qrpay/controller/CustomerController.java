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
	
	@RequestMapping("tableNo")
	public String tableNo() {
		return "customerpage/tableNo";
	} //tableNo();
	
	@RequestMapping("header")
	public String header() {
		
		return "customerpage/customerHeader";
	} //header();
	
	@RequestMapping("category")
	public String category() {
		
		return "customerpage/customerCategory";
	} //category();
	
} //CustomerController();