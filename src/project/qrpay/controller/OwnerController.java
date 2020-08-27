package project.qrpay.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.qrpay.service.OwnerService;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("owner")
public class OwnerController {
	
	@Autowired
	OwnerService ownerService;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public String loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String pw) {
		OwnerVO ownerVO;
		if((ownerVO=ownerService.loginOwner(id,pw)) != null) {
			session.setAttribute("loginInfo", ownerVO);
			return "main";
		}
		model.addAttribute("msg","false");
		return "login";
	} //loginAction
	
	//회원가입
	@RequestMapping("join")
	public String join(HttpSession session, @RequestParam Map<String, String> map) {
		
			return "join";
	} //join
	
	//회원가입 액션
	@RequestMapping("joinAction")
	public String joinAction(HttpSession session, @RequestParam Map<String, String> map) {
		map.put("license", map.get("license1").concat(map.get("license2")).concat(map.get("license3")));
		ownerService.joinOwner(map);
		return "main";
		
	} //joinAction

	
	
} //OwnerController();
