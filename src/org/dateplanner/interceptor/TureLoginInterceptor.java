package org.dateplanner.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TureLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			
		if(request.getSession().getAttribute("loginInfo") != null) {
			response.sendRedirect("../");
			return false;
		} //if
		
		return super.preHandle(request, response, handler);
	} //preHandle()
} //class
