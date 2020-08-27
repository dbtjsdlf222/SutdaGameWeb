package project.qrpay.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("store")
public class StoreController {
	
	@RequestMapping("/")
	public String main() {
		
		return "store";
	} //main();
	
} //StoreController();