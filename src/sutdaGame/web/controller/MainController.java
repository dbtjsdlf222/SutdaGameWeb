package sutdaGame.web.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.OwnerService;
import sutdaGame.web.vo.OwnerVO;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired
	JavaMailSender mailSender;
	
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
		
	//메일보내기
	@RequestMapping(value = "mailSending")
    public String mailSending(HttpServletRequest request) {
		   
	    String setfrom = "apdlvmf1562@gmail.com";
	    String tomail = request.getParameter("tomail"); 		// 받는 사람 이메일
	    String title = request.getParameter("title"); 			// 제목
	    String content = request.getParameter("content"); 		// 내용
	    try {  	
	    	MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom); 					// 보내는사람 생략하면 정상작동을 안함
	        messageHelper.setTo(tomail);						// 받는사람 이메일
	        messageHelper.setSubject(title); 					// 메일제목은 생략이 가능하다
	        messageHelper.setText(content); 					// 메일 내용
	        
	        mailSender.send(message);	        
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
