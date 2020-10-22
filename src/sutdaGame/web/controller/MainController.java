package sutdaGame.web.controller;

import java.util.Random;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	PlayerService playerService;
	
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
	
	@RequestMapping("update")
	public String update() {
		return "mainpage/update";
	} //회원정보 수정
	
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
		@RequestMapping(path="joinAction", params = {"id","password","nickname","email","character"})
		public ModelAndView joinAction(HttpSession session, PlayerVO playerVO) {
			if(playerService.playerJoin(playerVO)==1) {
				return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 성공하였습니다.\n 로그인 해주세요.","login");
			} else {
				return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 실패하였습니다.\n 다시 회원가입을 해주세요.","join");
			}
		} //joinAction
		
		@RequestMapping(path="ID_check",method = RequestMethod.POST)
		public String idCheck(HttpSession session,@RequestParam String id) throws JsonProcessingException {
			try {
				return JsonUtil.convertToJsonString(playerService.selectID(id));
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return JsonUtil.convertToJsonString(false);
		} // 
		
	//새소식
		@RequestMapping("news")
		public String news(HttpSession session) {
			return "board/news";
		}	//news
		
	//다운로드
		@RequestMapping("download")
		public String reference(HttpSession session) {
			return "mainpage/download";
		}	//download
		
	//커뮤니티
		@RequestMapping("community")
		public String community(HttpSession session) {
			return "board/community";
		}	//community
		
	//상점
		@RequestMapping("shop")
		public String shop(HttpSession session) {
			return "mainpage/shop";
		}	//shop
		
	//명예의 전당
		@RequestMapping("rank")
		public String rank() {
			return "board/rank";
		}	//rank
		
	//고객센터
		@RequestMapping("customer")
		public String customer(HttpSession session) {
			return "board/customer";
		}	//customer
		
} //MainController class 
