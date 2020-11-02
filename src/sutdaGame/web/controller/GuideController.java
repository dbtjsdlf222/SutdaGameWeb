package sutdaGame.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping("guide")
public class GuideController {
	@RequestMapping("guide")
	public String guide() {
		return "guide/guide";
	}
	
	@RequestMapping("guideHeader")
	public String guideHeader() {
		return "guide/guideHeader";
	}
	
	@RequestMapping("guideMenu")
	public String guideMenu() {
		return "guide/guideMenu";
	}
	
	@RequestMapping("guideScreen")
	public String guideScreen() {
		return "guide/guideScreen";
	}

}
