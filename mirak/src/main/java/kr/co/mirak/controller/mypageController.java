package kr.co.mirak.controller;


import javax.servlet.http.HttpSession;

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
public class mypageController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageview(MemberVO vo, Model model, HttpSession session) {
		System.out.println("마이페이지로 이동..");
		
		String myid = (String)session.getAttribute("mem_id");
		vo.setMem_id(myid);
		MemberVO member = memberService.mypage(vo);
	    model.addAttribute("member", member);
		
		return "member/mypage";
	}
}










