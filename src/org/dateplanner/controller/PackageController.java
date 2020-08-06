package org.dateplanner.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dateplanner.commons.Region;
import org.dateplanner.service.CommentService;
import org.dateplanner.service.LikeService;
import org.dateplanner.service.PackageService;
import org.dateplanner.util.FileReceiver;
import org.dateplanner.util.JsonUtil;
import org.dateplanner.util.RedirectWithAlert;
import org.dateplanner.vo.Package;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.Post;
import org.dateplanner.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller @RequestMapping("package")
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private LikeService likeService;
	
	@RequestMapping("create")
	public ModelAndView create(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("regionNo", Region.getRegionNo(session));
		model.addObject("placeList", packageService.selectPackageable(((User)session.getAttribute("loginInfo")).getNo()));
		
		return model;
		
	} //create();
	
	@RequestMapping("img/upload")
	public ResponseEntity<String> writeUpload(MultipartHttpServletRequest request)
			throws IOException { return JsonUtil.convertToResponseEntity(Collections.singletonMap("result", FileReceiver.receiveFile(request, "/package/img/"))); }
	
	@RequestMapping(path = "doCreate", params = { "title", "content", "image", "placeList", "regionNo" })
	public ModelAndView doCreate(HttpSession session, @ModelAttribute Post post, String placeList) {
		
		Package pack = new Package();
		post.setUser(new User(((User)session.getAttribute("loginInfo")).getNo()));
		pack.setPost(post);
		List<Post> _placeList = new ArrayList<>();
		if(!placeList.isEmpty()) {
			String[] placeArr = placeList.split(",");
			for(String place : placeArr)
				_placeList.add(new Post(Integer.parseInt(place)));
		}
		pack.setPlaceList(_placeList);
		
		if(!packageService.createPackage(pack))
			return new RedirectWithAlert("패키지 작성 - DatePlanner", "패키지 작성에 실패했습니다", "create");
		
		return new ModelAndView("redirect:../");
		
	} //doCreate();
	
	@RequestMapping("view/{no}")
	public ModelAndView view(HttpSession session, @PathVariable int no, Integer r, @RequestParam(defaultValue = "1") int p) {

		Page page = new Page(4, 5, p); //result 개수, 페이징 블록 수, 페이지 넘버
		
		ModelAndView model = new ModelAndView("package/view");
		
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		User user = (User)session.getAttribute("loginInfo");
		params.put("boardNo", no);
		params.put("userNo",user.getNo());
		model.addObject("userNo" , user.getNo());
		model.addObject("pack", packageService.selectPackage(no));
		model.addObject("profile", user.getProfile());
		model.addObject("comment", commentService.selectByBoardNo(no, page));
		model.addObject("page"   , page);
		model.addObject("like"   , likeService.selectCount(no));
		model.addObject("likeCheck", likeService.userCheck(params));
		
		return model;
		
	} //view();
	
	@RequestMapping("like")
	public String likeInsert(@RequestParam int boardNo, HttpSession session, HttpServletRequest req) {
		
		User user = new User();
		user = (User)session.getAttribute("loginInfo");
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		
		params.put("boardNo", boardNo);
		params.put("userNo", user.getNo());
		
		if(likeService.userCheck(params) == 0)
		     { likeService.insertLike(params); }
		else { likeService.deleteLike(params); }
		 	
		return "redirect:/package/view/"+boardNo;
	} //like()
	
	@RequestMapping("delete/{no}")
	public String delete(@PathVariable int no) {
		packageService.deletePackage(no);
		return "redirect:/";
	} //delete();
	
} //class PackageController;
