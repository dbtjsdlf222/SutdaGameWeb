package sutdaGame.web.controller;

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