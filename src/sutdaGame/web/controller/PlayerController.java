package sutdaGame.web.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.MoneyFormat;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("player")
public class PlayerController {
	
	@Autowired PlayerService playerService;
	@Autowired JavaMailSender mailSender;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public ModelAndView loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String password) {
		PlayerVO playerVO = playerService.loginPlayer(id);
		if((playerVO=playerService.loginPlayer(id)) != null && BCrypt.checkpw(password, playerVO.getPassword())) {
			session.setAttribute("loginInfo", playerVO);
			return new ModelAndView("mainpage/main");
		} else {
			return new RedirectWithAlert("로그인-섯다온라인","아이디나 비밀번호가 틀렸습니다.","/login");
		}
	} //loginAction
	
	@RequestMapping("mypage")
	public ModelAndView mypage(ModelAndView model, HttpSession session) {
		try {
			PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
			model.setViewName("mainpage/mypage");
			PlayerVO svo = playerService.selectPlayer(vo.getNo());
			svo.setStrMoney(MoneyFormat.format(svo.getMoney()));
			model.addObject("myInfo", svo);
		} catch (NullPointerException e) {
			return new RedirectWithAlert("유저정보 페이지 - 섯다온라인", "유저를 찾을수 없습니다", "/login");
		}
		return model;
	} // mypage
	
	@RequestMapping("findID_form")
	public String findIDForm(Model model,HttpSession session) {
		
		return "player/find_ID";
	}
	
	@RequestMapping("findPW_form")
	public String findPWForm(Model model,HttpSession session) {
		
		return "player/find_PW";
	}
	
	@RequestMapping(path="update")
	public String update(Model model,HttpSession session) {
		
		return "/player/update_form";
	}
	
	@RequestMapping(value="findID",method = RequestMethod.POST)
	public ModelAndView findID(@RequestParam String mail, @RequestParam String name, HttpSession session) {
		String id=null;
		if((id=playerService.findID(mail, name)) == null) {
			return new RedirectWithAlert("알림","일치하는 정보가 없습니다.","/player/findID_form");
		} else {
			StringBuffer sb = new StringBuffer();
			sb.append("<h1>안녕하세요 "+name+"님 가입 아이디 보내드립니다.</h1>");
			sb.append("<hr>");
			sb.append("<h2 style='display:inline'>"+name+"님의 가입 아이디는<h2><h1 style='display:inline'>["+ id + "]</h1> <h2>입니다.</h2>");
			sb.append("<hr>");
			String subject = "섯다 아이디 찾기 인증 메일";
			
			 try {
				    String setfrom = "sutdaonline@gmail.com";
			    	MimeMessage message = mailSender.createMimeMessage(); //에러 발생
			        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			        messageHelper.setFrom(setfrom);	// 보내는사람 생략하면 정상작동을 안함
			        messageHelper.setTo(mail);			// 받는사람 이메일
			        messageHelper.setSubject(subject); 	// 메일제목은 생략이 가능하다
			        messageHelper.setText(sb.toString(),true); 					// 메일 내용
			        mailSender.send(message);
			        return new RedirectWithAlert("알림","메일로 아이디를 전송해 드렸습니다.","/login");
				 } catch (Exception e) {
				    e.printStackTrace();
				 }
			return new RedirectWithAlert("알림","잘못된 요청입니다.","/player/findID_form");
		}
	}
	
	@RequestMapping(value="findPW",method = RequestMethod.POST, params= {"mail","id"})
	public ModelAndView findPW(String mail, String id,HttpServletRequest request, HttpSession session){
		
		String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		Integer no = null;
		if((no=playerService.findPW(id, mail)) == null) {
			return new RedirectWithAlert("알림","일치하는 정보가 없습니다.","/player/findPW_form");
		} else {
			UUID uuid =UUID.randomUUID();
			session.setAttribute("code", uuid);
			session.setAttribute("no", no);
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>비밀번호를 변경 하시려면 <a href=\""+url+"/player/changePW?code="+uuid+"\">비밀번호 변경</a>을 눌러주세요</h3>");
			String subject = "섯다 비밀번호 찾기 인증 메일 입니다.";
			 try {
				    String setfrom = "sutdaonline@gmail.com";
			    	MimeMessage message = mailSender.createMimeMessage(); //에러 발생
			        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			        messageHelper.setFrom(setfrom); 							// 보내는사람 생략하면 정상작동을 안함
			        messageHelper.setTo(mail);								// 받는사람 이메일
			        messageHelper.setSubject(subject); 	// 메일제목은 생략이 가능하다
			        messageHelper.setText(sb.toString(),true); 					// 메일 내용
			        mailSender.send(message);
				 } catch (Exception e) {
				    e.printStackTrace();
				 }
			return new RedirectWithAlert("알림","메일로 링크를 전송해 드렸습니다.","/main");
		}
	}
	
	@RequestMapping(path="updateAction", params = {"password"}, method = RequestMethod.POST)
	public String updateAction(HttpSession session, PlayerVO playerVO) {
		playerVO.setPassword(BCrypt.hashpw(playerVO.getPassword(), BCrypt.gensalt()));
		playerService.updatePlayer(playerVO);
		return "redirect:mypage";
	}
	
	@RequestMapping(value="changePW",method = RequestMethod.GET)
	public ModelAndView changePW(@RequestParam UUID code, HttpSession session) {
		if(((UUID)session.getAttribute("code")).equals(code)) {
			ModelAndView mav = new ModelAndView("player/changePW_Form");
			mav.addObject("code",code);
			return mav;
		}
		return new RedirectWithAlert("알림","잘못된 요청입니다","/");
	}
	
	@RequestMapping(value="changePWAction",params = {"code","password","csrf_token"},method = RequestMethod.POST)
	public ModelAndView changePWAction(String code,String password, HttpSession session) {
		UUID a=UUID.fromString(code);
		UUID b=(UUID)session.getAttribute("code");
		if((b).equals(a)) {
			playerService.pwChange(BCrypt.hashpw(password,BCrypt.gensalt()), (Integer)session.getAttribute("no"));
			session.removeAttribute("code");
			session.removeAttribute("no");
			return new RedirectWithAlert("알림","비밀변호가 정상적으로 변경 되었습니다.","/");
		}
		return new RedirectWithAlert("알림","잘못된 요청입니다","/");
	} //changePWAction();
	
	@RequestMapping("main")
	public String main() {
		return "mainpage/main";
	} // main();
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.getAttribute("loginInfo");
		return "mainpage/main";
	} // logout();
	
	@RequestMapping("delete")
	public ModelAndView deletePlayer(HttpSession session) {
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		playerService.deletePlayer(vo.getNo());
		session.removeAttribute("loginInfo");
		return new RedirectWithAlert("회원탈퇴","회원탈퇴가 완료되었습니다.","/");
	} //deletePlayer();
	
} //playerController();