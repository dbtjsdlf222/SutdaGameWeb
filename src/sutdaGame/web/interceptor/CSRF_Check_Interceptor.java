package sutdaGame.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CSRF_Check_Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String sessionCSRF= ((String) session.getAttribute("csrf_token"));
		String paramCSRF = request.getParameter("csrf_token");
		if (!sessionCSRF.equals(paramCSRF)) {
			response.sendRedirect("/error/500");
			return false;
		}

		return super.preHandle(request, response, handler);
	} // preHandle();

} // class LoginInterceptor;
