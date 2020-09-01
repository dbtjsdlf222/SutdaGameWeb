package project.qrpay.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FalseLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute("loginInfo") == null) {
			response.sendRedirect("/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	} //preHandle();
} //class LoginInterceptor;