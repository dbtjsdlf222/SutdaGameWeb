package project.qrpay.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.qrpay.service.MenuService;
import project.qrpay.vo.OwnerVO;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	MenuService ms;
	
	@RequestMapping("/")
	public String main() {
		return "customerpage/customerView";
	} //main();
	
	@RequestMapping("tableAction")
	public String tableNo(int no) {
		return "customerpage/tableNo";
	} //tableNo();
	
	@RequestMapping("header")
	public String header() {
		
		return "customerpage/customerHeader";
	} //header();
	
	@RequestMapping("category")
	public String category(HttpSession session, Model model) {
		
		OwnerVO vo = (OwnerVO)session.getAttribute("loginInfo");
		model.addAttribute("categoryInfo", ms.selectCategoryList(vo.getNo()));
		
		
		return "customerpage/customerCategory";
	} //category();
	
} //CustomerController();