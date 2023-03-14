package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter{

   private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
   static final String[] EXCLUDE_URL_LIST = {"/admin", "/join", "/idCheck", "/login", "/ProductClientList", "/ProductClientListP", "/ProductClientListT", "/ProductClientListQ", "/ProductClientDetail" , "/naverSave","/apiJoin", "/mailCheck", "/memupdate","/idfind"};

	//	private void getDestination(HttpServletRequest request) {
	//        String uri = request.getRequestURI();
	//        String query = request.getQueryString();
	//        
	//        if (query == null || query.equals("null")) {
	//            query = "";
	//        } else {
	//            query = "?" + query;
	//        }
	//
	//        if (request.getMethod().equals("GET")) {
	//            logger.info("destination : " + (uri + query));
	//            request.getSession().setAttribute("destination", uri + query);
	//        }
	//    }

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//logger.info("===== [preHandle 시작] =====");
		String refUrl = request.getHeader("Referer");
		String regUrl = request.getRequestURL().toString();
		String preUrl = request.getRequestURI().toString();

//		logger.info("[preHandle] request.getHeader() " + refUrl);
//		logger.info("[preHandle] request.getRequestURL() " + regUrl);
//		logger.info("[preHandle] request.getRequestURI() " + preUrl);
//
//
//
//		logger.info("[cart_cnt] " + request.getParameter("cart_cnt"));
//		logger.info("[pro_code] " + request.getParameter("pro_code"));


		for (String target : EXCLUDE_URL_LIST) {
			if (regUrl.indexOf(target) > -1) {
				return true;
			}
		}

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("mem_id");
		//logger.info("[memberId] " + memberId);

		if(memberId == null || memberId.trim().equals("")) {
			logger.info(">> interceptor catch!!! mem_id is null.. ");
			session.invalidate();

			request.getSession().setAttribute("pre_url", preUrl);
			response.sendRedirect(request.getContextPath() + "/login");
			logger.info("===== [preHandle 끝] =====");

			return false;
		} else {
			//logger.info("===== [preHandle 끝] =====");
			return true;
		}
	}

}