package kr.co.mirak.controller;


import java.util.List;

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
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
		System.out.println("로그인 화면으로 이동...");
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, Model model) {
		String mem_id = memberService.login(memberVO).getMem_id();
		
		if(mem_id == null || mem_id.equals("")) {
//			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		if (mem_id != null) {
			model.addAttribute("mem_id", mem_id);
			return "redirect:/";
		} else {
			System.out.println("d");
			return "member/login";
		}
	}
}












