package sutdaGame.web.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.util.MoneyFormat;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.util.SendMail;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("player")
public class PlayerController {
	
	@Autowired
	PlayerService playerService;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public ModelAndView loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String password) {
		PlayerVO PlayerVO;
		if((PlayerVO=playerService.loginPlayer(id,password)) != null) {
			session.setAttribute("loginInfo", PlayerVO);
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
			svo.setStrMoney(new MoneyFormat().format(svo.getMoney()));
			model.addObject("myInfo", svo);
		} catch (NullPointerException e) {
			return new RedirectWithAlert("유저정보 페이지 - 섯다온라인", "유저를 찾을수 없습니다", "/login");
		}
		return model;
	} // mypage
	
	@RequestMapping("findID_form")
	public String findIDForm() {
		return "player/find_ID";
	}
	@RequestMapping("findID")
	public ModelAndView findID(@RequestParam String mail, @RequestParam String name) {
		
		String id=null;
		if((id=playerService.findID(mail, name))==null) {
			return new RedirectWithAlert("알림","일치하는 정보가 없습니다.","/player/findID");
		} else {
			StringBuffer sb = new StringBuffer();
			sb.append("<h1>안녕하세요 "+name+"님 가입 아이디 보내드립니다.</h1>");
			sb.append("<hr>");
			sb.append("<h2>"+name+"님의 가입 아이디는 [<h1>"+ id + "</h1>] 입니다.</h3>");
			sb.append("<hr>");
			String subject = "섯다 아이디 찾기 메일 입니다.";
			new SendMail().mailSender(mail, subject, sb);
			return new RedirectWithAlert("알림","메일로 아이디를 전송해 드렸습니다.","/player/findID");
		}
	}
	
	
	@RequestMapping("main")
	public String main() {
		return "mainpage/main";
	} // main
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "mainpage/main";
	} // logout
	
	@RequestMapping("delete")
	public ModelAndView deletePlayer(HttpSession session) {
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		playerService.deletePlayer(vo.getNo());
		session.removeAttribute("loginInfo");
		return new RedirectWithAlert("회원탈퇴","회원탈퇴가 완료되었습니다.","/");
	} // 
	
	@RequestMapping(path="update", params = {"name","id"})	//등등
	public String update(HttpSession session,PlayerVO vo) {
		return "/mainpage/update";
	} //

	
} //playerController();