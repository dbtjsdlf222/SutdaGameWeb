package sutdaGame.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

@Controller
public class GuideController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuideController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String guide(Model model) {
		logger.info("guide call...");
		return "guide/guide";
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String guideHeader(Model model) {
		logger.info("guideHeader call...");
		return "guide/guideHeader";
		
	}@RequestMapping(value="/", method=RequestMethod.GET)
	public String guideMenu(Model model) {
		logger.info("guideMenu call...");
		return "guide/guideMenu";
		
	}@RequestMapping(value="/", method=RequestMethod.GET)
	public String guideScreen(Model model) {
		logger.info("guideScreen call...");
		return "guide/guideScreen";
	}
}
