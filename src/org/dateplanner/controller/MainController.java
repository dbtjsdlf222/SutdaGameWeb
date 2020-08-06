package org.dateplanner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dateplanner.commons.Region;
import org.dateplanner.service.PostService;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(path = { "/", "main", "index" })
	public ModelAndView main(HttpServletRequest request, HttpSession session, Integer r, @RequestParam(defaultValue = "1") int p, @RequestParam(required = false) String title) {
		
		ModelAndView model = new ModelAndView("main");
		
		if(r != null && 0 <= r && r < Region.LIST.size())
			session.setAttribute("regionNo", r);
		
		int regionNo = Region.getRegionNo(session);
		Page page = new Page(10, 5, p); //result 개수, 페이징 블록 수, 페이지 넘버
		User user;
		if((user = (User)session.getAttribute("loginInfo")) != null) {
			model.addObject("loginInfo",user);
		}
		model.addObject("postList", title==null ? postService.selectByRegionWithPage(regionNo, page) : postService.selectByTitleAndRegionWithPage(title, page));
		model.addObject("regionNo", regionNo);
		model.addObject("page", page);
		model.addObject("title", title);
		
		return model;
		
	} //main();
	
} //class MainController;