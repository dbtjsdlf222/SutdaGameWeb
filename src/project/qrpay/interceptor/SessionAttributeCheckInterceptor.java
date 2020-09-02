package project.qrpay.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionAttributeCheckInterceptor extends HandlerInterceptorAdapter {
	
	private String attribute;
	private String redirect;
	private boolean exist;
	
	public SessionAttributeCheckInterceptor(String attribute, boolean exist, String redirect) {
		this.attribute = attribute;
		this.exist = exist;
		this.redirect = redirect;
	} //SessionAttributeCheckInterceptor();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if((request.getSession().getAttribute(attribute) != null) == exist) {
			response.sendRedirect(redirect);
			return false;
		}
		
		return super.preHandle(request, response, handler);
		
	} //preHandle();
	
} //class LoginInterceptor;
