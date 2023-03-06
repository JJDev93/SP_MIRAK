package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
<<<<<<< HEAD


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
=======
>>>>>>> branch 'Member' of https://github.com/ywshin0112/mirak.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mirak.member.MemberVO;


@Controller
public class LoginController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
<<<<<<< HEAD
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */


	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
=======
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(@ModelAttribute("Member") MemberVO vo) {
		System.out.println("로그인 화면으로 이동...");
		return "login";
>>>>>>> branch 'Member' of https://github.com/ywshin0112/mirak.git
	}
<<<<<<< HEAD
	
=======

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		if(vo.getMem_id() == null || vo.getMem_id().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
//		MemberVO user = userDAO.getUser(vo);
//		if (user != null) {
//			session.setAttribute("userName", user.getName());
//			return "getBoardList.do";
//		} else
//			return "login";
		return "login";
	}
>>>>>>> branch 'Member' of https://github.com/ywshin0112/mirak.git
}

