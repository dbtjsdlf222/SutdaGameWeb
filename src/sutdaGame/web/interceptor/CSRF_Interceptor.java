package sutdaGame.web.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CSRF_Interceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		String sessionCSRF =((String)session.getAttribute("csrf_token"));
		if(sessionCSRF==null) {
			System.out.println("csrf 토큰 생성");
			session.setAttribute("csrf_token", UUID.randomUUID().toString());
		}
		response.setHeader("csrf_token", sessionCSRF);
		
		return super.preHandle(request, response, handler);
	} //preHandle();
	
} //class LoginInterceptor;
