package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	static final String[] EXCLUDE_URL_LIST = {"/admin", "/join", "/idCheck", "/login", "/ProductClientList", "/ProductClientListP", "/ProductClientListT", "/ProductClientListQ", "/ProductClientDetail" };

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("[preHandle]");
		String regUrl = request.getRequestURL().toString();
		
		for (String target : EXCLUDE_URL_LIST) {
			if (regUrl.indexOf(target) > -1) {
				return true;
			}
		}

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("mem_id");
		
		if(memberId == null || memberId.trim().equals("")) {
			logger.info(">> interceptor catch!!! mem_id is null.. ");
			session.invalidate();
			
			String preUrl = request.getRequestURI().toString();

			System.out.println("-------------------");
			System.out.println("mem_id : " + memberId);
			System.out.println("getRequestURI : " + request.getRequestURI().toString());
			System.out.println("-------------------");
			
			request.getSession().setAttribute("pre_url", preUrl);
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		} else {
			return true;
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[postHandle]");
		super.postHandle(request, response, handler, modelAndView);
	}
}
