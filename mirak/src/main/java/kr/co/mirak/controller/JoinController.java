
package kr.co.mirak.controller;

import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/join")
	public String joinGET(Model model) {
		logger.info("회원가입페이지입니다.");
		logger.info(model.toString());
		return "member/login";
		
	}
	
}
