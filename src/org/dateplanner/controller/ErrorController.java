package org.dateplanner.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping("error")
public class ErrorController {
	@RequestMapping("404")
	 public String handle404(HttpServletResponse res , Exception e) {
		 res.setStatus(HttpServletResponse.SC_OK); //Response 상태를 정상으로 만듦
		 return "redirect:/";
	 } //404
	
	@RequestMapping("500")
	 public String handle500(HttpServletResponse res) {
		 res.setStatus(HttpServletResponse.SC_OK); //Response 상태를 정상으로 만듦
		 return "redirect:/";
	 } //500 
} //class
