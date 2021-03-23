package sutdaGame.web.controller;

import java.io.IOException;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
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
import sutdaGame.web.util.LimitTimer;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.util.RegularChecker;
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
	public String login(HttpSession session,HttpServletRequest request) {
		session.setAttribute("referer",request.getHeader("Referer"));
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
		return "redirect:/";
	} //logout
	
	@RequestMapping("download")
	public ModelAndView download(HttpSession session)  throws URISyntaxException, IOException {
			Object obj = session.getAttribute("number");
			long number;
			
			if(obj==null) {
				session.setAttribute("number",LimitTimer.userNumber++);
			} else {
				number = (long)session.getAttribute("number");
			}
			number = ((long) session.getAttribute("number"));
			
			if(LimitTimer.downloadList.get(number)!=null) {
				return new RedirectWithAlert("섯다온라인-알림", "짧은 기간내에 다중 다운로드는 불가능합니다. 잠시 후 다시 시도해 주시기 바랍니다.", "/");
			} else {
				LimitTimer.downloadList.put(number,false);
				return new ModelAndView("redirect:/SutdaClient.exe");
			}
	} //download
	
	//회원가입 액션
	@RequestMapping(path="joinAction", params = {"name","id","password","passwordc","nickname","email","character","csrf_token"}, method = RequestMethod.POST)
	public ModelAndView joinAction(HttpSession session, PlayerVO playerVO, String passwordc, ModelAndView model) {
		playerVO.setPassword(BCrypt.hashpw(playerVO.getPassword(), BCrypt.gensalt()));
		
		String error = new RegularChecker().join(playerVO, passwordc, playerService);
		if(!error.equals("")) {
			return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 실패하였습니다. "+error+"(을)를 확인 해주세요.","/join");
		}
		if(playerService.playerJoin(playerVO) == 1) {
			return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 성공하였습니다. 로그인 해주세요.","/main");
		} else {
			return new RedirectWithAlert("회원가입 - 섯다 온라인","회원가입에 실패하였습니다. 다시 회원가입을 해주세요.","/join");
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
