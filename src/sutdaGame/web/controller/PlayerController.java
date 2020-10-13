package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sutdaGame.web.service.PlayerService;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("owner")
public class PlayerController {
	
	@Autowired
	PlayerService ownerService;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public String loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String pw) {
		PlayerVO PlayerVO;
		if((PlayerVO=ownerService.loginOwner(id,pw)) != null) {
			System.out.println("Ownercontroller:28");
			session.setAttribute("loginInfo", PlayerVO);
			return "mainpage/main";
		}
		model.addAttribute("msg","false");
		return "mainpage/login";
	} //loginAction
	
	@RequestMapping("mypage")
	public String mypage(Model model, HttpSession session) {
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		model.addAttribute("myInfo", ownerService.selectOwner(vo.getNo()));
		return "mainpage/mypage";
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

} //OwnerController();