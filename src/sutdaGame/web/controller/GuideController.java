package sutdaGame.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping("guide")
public class GuideController {
	
	@RequestMapping("guideHeader")
	public String guideHeader() {
		return "guide/guideHeader";
	}
	
	@RequestMapping("guideMenu")
	public String guideMenu() {
		return "guide/guideMenu";
	}
	
	@RequestMapping("guideView")
	public String guideView() {
		return "guide/guideView";
	}
	
	@RequestMapping("intro")
	public String intro() {
		return "guide/intro";
	}
	
	@RequestMapping("jokbo")
	public String jokbo() {
		return "guide/jokbo";
	}

}