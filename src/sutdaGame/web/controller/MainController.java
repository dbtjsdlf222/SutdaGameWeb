package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("/")
public class MainController {
	
	@Autowired JavaMailSender mailSender;
	@Autowired PlayerService  playerService;
	@Autowired BoardService   boardService;
	
	//메인
	@RequestMapping(path={"/","main"})
	public String main(Model model) {
		model.addAttribute("money",playerService.rankByMoney());
		model.addAttribute("rate",playerService.rankByRate());
		model.addAttribute("youtube",boardService.selectBoardList(10, new Page(4,4,1)));
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
	
	@RequestMapping("download")
	public String download() {
		return "mainpage/download";
	}	//download
		
	//회원가입 액션
	@RequestMapping(path="joinAction", params = {"name","id","password","nickname","email","character"})
	public ModelAndView joinAction(HttpSession session, PlayerVO playerVO) {
		playerVO.setPassword(BCrypt.hashpw(playerVO.getPassword(), BCrypt.gensalt()));
		if(playerService.playerJoin(playerVO)==1) {
			return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 성공하였습니다.\n 로그인 해주세요.","/main");
		} else {
			return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 실패하였습니다.\n 다시 회원가입을 해주세요.","/join");
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
		
} //MainController class 
