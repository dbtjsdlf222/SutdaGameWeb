package project.qrpay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
//	@Autowired
//	CommentService commentService;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
} //class 
