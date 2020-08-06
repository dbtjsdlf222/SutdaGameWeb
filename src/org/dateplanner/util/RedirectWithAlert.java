package org.dateplanner.util;

import org.springframework.web.servlet.ModelAndView;

public class RedirectWithAlert extends ModelAndView {
	
	private RedirectWithAlert() { setViewName("util/redirectWithAlert"); }
	
	public RedirectWithAlert(String title) {
		
		this();
		setTitle(title);
		
	} //RedirectWithAlert();
	
	public RedirectWithAlert(String title, String redirect) {
		
		this(title);
		setRedirect(redirect);
		
	} //RedirectWithAlert();
	
	public RedirectWithAlert(String title, String message, String redirect) {
		
		this(title, redirect);
		setMessage(message);
		
	} //RedirectWithAlert();
	
	public RedirectWithAlert setTitle(String title) { addObject("title", title); return this; }
	public RedirectWithAlert setMessage(String message) { addObject("message", message); return this; }
	public RedirectWithAlert setRedirect(String redirect) { addObject("redirect", redirect); return this; }
	
} //class RedirectWithAlert;
