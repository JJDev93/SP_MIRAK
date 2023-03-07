
package kr.co.mirak.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class JoinController {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinview() {
		System.out.println("회원가입 화면으로 이동!");
		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinSeccess(MemberVO vo , Model model) {
		
		sqlSessionTemplate.insert("member.join",vo);
		
		
		memberService.createUser(vo);
		
		
		System.out.println("가입성공" );
		return "redirect:/member/login";
	}
}

/*
 * @RequestMapping("/join") public String joinGET(Model model) {
 * logger.info("회원가입페이지입니다."); logger.info(model.toString()); return
 * "member/login";
 * 
 * }
 */
