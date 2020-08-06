package org.dateplanner.controller;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.dateplanner.commons.Region;
import org.dateplanner.service.UserService;
import org.dateplanner.util.FileReceiver;
import org.dateplanner.util.JsonUtil;
import org.dateplanner.util.RedirectWithAlert;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller @RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("join")
	public ModelAndView join(HttpSession session) { return new ModelAndView().addObject("regionNo", Region.getRegionNo(session)); }
	
	@RequestMapping("img/upload")
	public ResponseEntity<String> writeUpload(MultipartHttpServletRequest request)
			throws IOException { return JsonUtil.convertToResponseEntity(Collections.singletonMap("result", FileReceiver.receiveFile(request, "/user/img/")));}
	
	@RequestMapping(path = "doJoin", params = { "id", "password", "name", "nickname", "regionNo", "profile", "introduction" })
	public ModelAndView doJoin(@ModelAttribute User user, String password) {

		user.setKey(password);
		
		RedirectWithAlert redirect = new RedirectWithAlert("회원가입 - DatePlanner");
		
		boolean idExist;
		if((idExist = userService.idExist(user.getId())) || !userService.join(user))
			return redirect.setMessage(idExist ? "이미 존재하는 아이디 입니다" : "회원가입에 실패했습니다").setRedirect("join");
		
		return redirect.setMessage("회원가입에 성공했습니다").setRedirect("../");
		
	} //doJoin();
	
	@RequestMapping("login")
	public void login() {};
	
	@RequestMapping(path = "doLogin", params = { "id", "password" })
	public ModelAndView doLogin(HttpSession session, String id, String password) {
		
		User loginInfo = userService.login(id, password);
		if(loginInfo == null)
			return new RedirectWithAlert("로그인 - DatePlanner", "아이디 혹은 비밀번호가 틀립니다", "login");
		session.setAttribute("loginInfo", loginInfo);
		if(loginInfo.getRegionNo() != null)
			session.setAttribute("regionNo", loginInfo.getRegionNo());
		return new ModelAndView("redirect:../");
		
	} //doLogin();
	
	@RequestMapping(path = "doLogin", params = "no")
	public ModelAndView doLogin(HttpSession session, int no) {
		session.setAttribute("loginInfo", userService.selectUser(no));
		return new ModelAndView("redirect:../");
		
	} //doLogin();
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		
		return "redirect:../";
		
	} //logout();

	@RequestMapping("mypage")
	public String mypage(HttpSession session) { return "redirect:page/" + ((User)session.getAttribute("loginInfo")).getNo(); }
	
	@RequestMapping("update")
	public String update(@ModelAttribute User user, HttpSession session) {
		User sessionUser = (User)session.getAttribute("loginInfo");
		int userNo = sessionUser.getNo();
		user.setNo(userNo);
		userService.update(user);
		session.setAttribute("loginInfo", userService.selectUser(userNo));
		return "redirect:mypage";
	}

	@RequestMapping("updateForm")
	   public String update(HttpSession session,Model model){
		User user = (User)session.getAttribute("loginInfo");
		model.addAttribute("user",userService.selectUser(user.getNo()));
	      return "user/updateForm";
	}
	
	@RequestMapping("delete")
	   public String delete(@RequestParam int no, HttpSession session) {
		userService.delete(no);
		session.removeAttribute("loginInfo");
	      return "redirect:/";
	}
	
	@RequestMapping("page/{no}")
	public ModelAndView page(HttpSession session, @PathVariable Integer no, @RequestParam(defaultValue = "1") int p) {
		
		ModelAndView model = new ModelAndView("user/page");
		
		User user=(User)session.getAttribute("loginInfo");
		if(user.getNo() == no){
			model.addObject("mypage", true);
		}
		user = userService.selectUser(no);
		if(no == null) return new RedirectWithAlert("유저정보 페이지 - DatePlanner", "유저를 찾을수 없습니다", "../../");
		
		Page page = new Page(8, 8, p);
		
		model.addObject("userInfo", user);
		model.addObject("postList", userService.selectUsersPost(no, page));
		model.addObject("page", page);
		return model;
		
	} //page();
	
} //class LoginController;