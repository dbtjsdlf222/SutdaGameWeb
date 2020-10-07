package sutdaGame.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.OwnerService;
import sutdaGame.web.vo.OwnerVO;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired
	OwnerService ownerService;
	
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
			return "mainpage/main";
		} //joinAction
		
	//새소식
		@RequestMapping("news")
		public String news(HttpSession session) {
			return "mainpage/news";
		}	//news
		
	//자료실
		@RequestMapping("reference")
		public String reference(HttpSession session) {
			return "mainpage/reference";
		}	//reference
		
	//커뮤니티
		@RequestMapping("community")
		public String community(HttpSession session) {
			return "mainpage/community";
		}	//news
		
	//상점
		@RequestMapping("shop")
		public String shop(HttpSession session) {
			return "mainpage/shop";
		}	//shop
		
	//명예의 전당
		@RequestMapping("rank")
		public String rank(HttpSession session) {
			return "mainpage/rank";
		}	//rank
		
	//고객센터
		@RequestMapping("customer")
		public String customer(HttpSession session) {
			return "mainpage/customer";
		}	//customer
		
} //MainController class 
