package project.qrpay.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.qrpay.service.OwnerService;
import project.qrpay.service.StoreService;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("owner")
public class OwnerController {
	
	@Autowired
	OwnerService ownerService;
	
	@Autowired
	StoreService storeService;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public String loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String pw) {
		OwnerVO ownerVO;
		if((ownerVO=ownerService.loginOwner(id,pw)) != null) {
			System.out.println("Ownercontroller:28");
			session.setAttribute("loginInfo", ownerVO);
			return "mainpage/main";
		}
		model.addAttribute("msg","false");
		return "mainpage/login";
	} //loginAction

} //OwnerController();