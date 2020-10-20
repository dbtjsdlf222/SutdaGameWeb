package sutdaGame.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sutdaGame.web.util.RedirectWithAlert;

@RequestMapping("")
public class ErrorContorllor {
	
	@RequestMapping("404")
	public ModelAndView error404() {
		return new RedirectWithAlert("알림","없는 페이지 입니다","/main");
	}
	
	@RequestMapping("404")
	public ModelAndView error404() {
		return new RedirectWithAlert("알림","없는 페이지 입니다","/main");
	}
	
	@RequestMapping("404")
	public ModelAndView error404() {
		return new RedirectWithAlert("알림","없는 페이지 입니다","/main");
	}
	
}
