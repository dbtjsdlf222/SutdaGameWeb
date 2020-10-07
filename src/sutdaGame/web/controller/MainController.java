package sutdaGame.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.MainService;
import sutdaGame.web.service.OwnerService;
import sutdaGame.web.service.StoreService;
import sutdaGame.web.vo.OwnerVO;

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
		public String join(HttpSession session) {
			return "mainpage/join";
		} //join
		
		@RequestMapping("logout")
		public String logout(HttpSession session) {
			session.removeAttribute("loginInfo");
			return "mainpage/main";
		} //logout
		
		//회원가입 액션
		@RequestMapping("joinAction")
		public String joinAction(HttpSession session, OwnerVO ownerVO) {
			System.out.println(ownerVO);
			int ownerNo = ownerService.joinOwner(ownerVO);
			ownerVO.getStore().setStoreNo(ownerNo);
			System.out.println(ownerVO.getStore());
			storeService.insertStore(ownerVO.getStore());
			return "mainpage/main";
		} //joinAction
		
} //MainController class 
