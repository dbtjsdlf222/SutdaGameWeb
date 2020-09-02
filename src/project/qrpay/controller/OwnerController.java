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
import project.qrpay.service.StoreService;
import project.qrpay.vo.OwnerVO;

@Controller @RequestMapping("owner")
public class OwnerController {
	
	@Autowired
	OwnerService ownerService;
	
	@Autowired
	StoreService storeService;
	
	//로그인 액션
	@RequestMapping(value="loginAction", method=RequestMethod.POST)
	public String loginAction(Model model,HttpSession session,@RequestParam(required = true) String id, @RequestParam(required = true) String pw) {
		OwnerVO ownerVO;
		if((ownerVO=ownerService.loginOwner(id,pw)) != null) {
			System.out.println("Ownercontroller:28");
			session.setAttribute("loginInfo", ownerVO);
			return "mainpage/main";
		}
		model.addAttribute("msg","false");
		return "mainpage/login";
	} //loginAction
	
	//회원가입
	@RequestMapping("join")
	public String join(HttpSession session, @RequestParam Map<String, String> map) {
		return "mainpage/join";
	} //join
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "mainpage/main";
	} //logout
	
	//회원가입 액션
	@RequestMapping("joinAction")
	public String joinAction(HttpSession session, @RequestParam Map<String, String> map) {
		map.put("licenseNumber", map.get("license1").concat(map.get("license2")).concat(map.get("license3")));
		map.put("phone", map.get("phone1").concat(map.get("phone2")));
		map.put("email", map.get("email1").concat(map.get("email2")));
		ownerService.joinOwner(map);
		storeService.insertStore(map);
		return "mainpage/main";
	} //joinAction

} //OwnerController();