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
	public String login() {
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
		public String rank(HttpSession session) {
			return "mainpage/rank";
		}	//rank
		
	//고객센터
		@RequestMapping("customer")
		public String customer(HttpSession session) {
			return "board/customer";
		}	//customer
		
	//메일보내기
	@RequestMapping(value = "mailSending")
    public String mailSending(HttpServletRequest request, HttpSession session, String email, String name) {
		
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
		StringBuffer sb = new StringBuffer();

		sb.append("<h1>섯다 가입인증 메일입니다.</h1>");
		sb.append("<hr>");
		sb.append("<h3>환영합니다. " + request.getParameter("title") + "님 </h3>");
		sb.append("<h4>가입 인증 번호 : "+ dice + " 입니다.</h3>");
		sb.append("<hr>");
		
	    String setfrom = "apdlvmf1562@gmail.com";
	    String tomail = request.getParameter("tomail"); 		// 받는 사람 이메일
	    try {  	
	    	MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom); 					// 보내는사람 생략하면 정상작동을 안함
	        messageHelper.setTo(tomail);						// 받는사람 이메일
	        messageHelper.setSubject("섯다 가입 인증 메일입니다."); 					// 메일제목은 생략이 가능하다
	        messageHelper.setText(sb.toString(),true); 					// 메일 내용
	        
	        mailSender.send(message);	 
	        
	        session.setAttribute("code", dice);
	        
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	    
	    return "mailForm";
	}
	         
	         // mailForm
	         @RequestMapping(value = "/mail")
	         public String mailForm() {
	          
	           return "mail";
	         }  
		
} //MainController class 
