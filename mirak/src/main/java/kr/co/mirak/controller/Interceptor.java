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
	static final String[] EXCLUDE_URL_LIST = {"/join", "/idCheck", "/login", "/product" };

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
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
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}
}
