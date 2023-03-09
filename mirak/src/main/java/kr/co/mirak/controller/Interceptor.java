package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter{
	   private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	   static final String[] EXCLUDE_URL_LIST = {"/join", "/login", "/product" };
	   
	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	      String regUrl = request.getRequestURL().toString();
	      for (String target : EXCLUDE_URL_LIST) {
	         if (regUrl.indexOf(target) > -1) {
	            return true;
	         }
	      }
	      
	      HttpSession session = request.getSession();
	      String mem_id = (String) session.getAttribute("mem_id");
	      
	      if(mem_id == null || mem_id.trim().equals("")) {
	         logger.info(">> interceptor catch!!! userId is null.. ");
	         session.invalidate();
	         response.sendRedirect(request.getContextPath() + "/login");
	         return false;
	      }
	      return true;
	   }
}
