package project.qrpay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@RequestMapping("/")
	public String main() {
		
		return "storeSet";
	} //main();
	
	@RequestMapping("header")
	public String header() {
		
		return "header";
	}
	
	@RequestMapping("category")
	public String category() {
		
		return "category";
	}
	
	@RequestMapping("screen")
	public String screen() {
		
		return "screen";
	}
	
} //StoreController();