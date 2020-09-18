package project.qrpay.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.qrpay.service.BoardService;
import project.qrpay.service.MainService;
import project.qrpay.service.OwnerService;
import project.qrpay.service.StoreService;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	OwnerService ownerService;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	BoardService boardService;
	
	//메인
	@RequestMapping(path={"/","main"})
	public String main() {
		return "mainpage/main";
	} // main
	
	//로그인
	@RequestMapping("login")
	public String login(HttpSession session) {
		if(session.getAttribute("loginInfo") == null)
			return "mainpage/login";
		 else 
			return "redirect:main";
	} //login
	
	//회원가입
		@RequestMapping("join")
		public String join(HttpSession session, @RequestParam Map<String, String> map) {
			return "mainpage/join";
		} //join
		
		@RequestMapping("logout")
		public String logout(HttpSession session) {
			session.removeAttribute("loginInfo");
			return "mainpage/main";
		} //logout
		
		//회원가입 액션
		@RequestMapping("joinAction")
		public String joinAction(HttpSession session, @RequestParam Map<String, String> map) {
			map.put("licenseNumber", map.get("license1").concat(map.get("license2")).concat(map.get("license3")));
			map.put("phone", map.get("phone1").concat(map.get("phone2")));
			map.put("email", map.get("email1").concat(map.get("email2")));
			ownerService.joinOwner(map);
			storeService.insertStore(map);
			return "mainpage/main";
		} //joinAction
		
		@RequestMapping("boardList")
		public ModelAndView boardList() {
			ModelAndView mav = new ModelAndView("boardList");
			mav.addObject("boardList", boardService.selectBoardList());
			return mav;
		}
		
} //MainController class 
