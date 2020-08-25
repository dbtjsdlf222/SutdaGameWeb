package project.qrpay.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.qrpay.service.MainService;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	//메인
	@RequestMapping(path={"/","main"})
	public String main() {
		return "main";
	} // main
	
	//로그인
	@RequestMapping("login")
	public String login(HttpSession session) {
		if(session.getAttribute("loginInfo") == null) 
			return "login";
		 else 
			return "redirect:main";
	} //login
	
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public String loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String pw) {
		OwnerVO ownerVO;
		if((ownerVO=mainService.loginOwner(id,pw)) != null) {
			session.setAttribute("loginInfo", ownerVO);
			return "main";
		}
		model.addAttribute("msg","false");
		return "login";
	} //login
	
	@RequestMapping("join")
	public String join(HttpSession session, @RequestParam Map<String, String> map) {
			return "join";
	} //login
	
	@RequestMapping("joinAction")
	public String joinAction(HttpSession session, @RequestParam Map<String, String> map) {
		
		return "redirect:main";
	} //login
} //class 
