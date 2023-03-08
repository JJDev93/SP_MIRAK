package kr.co.mirak.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;


@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	//로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView() {
		System.out.println("로그인 화면으로 이동...");
		return "member/login";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(MemberVO memberVO, ModelAndView mav, HttpSession session) {
		String mem_id = memberService.login(memberVO).getMem_id();
		System.out.println("로그인한 아이디 : " + mem_id);
		
		if(mem_id == null || mem_id.equals("")) {
//			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
			System.out.println("아이디는 반드시 입력해야 합니다.");
		}
		
		if (mem_id != null) {
			session.setAttribute("mem_id", mem_id);
			if (mem_id.equals("admin")) {
				System.out.println("어드민 로그인 성공!!");
				mav.setViewName("redirect:/adminMembers");
			}else{
				System.out.println("로그인 성공!!");
				mav.setViewName("redirect:/");
			}
		} else {
			System.out.println("로그인 실패");
			mav.setViewName("member/login");
		}
		return mav;
	}
		
	//로그아웃
	@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();

			System.out.println("로그아웃 성공!!");
			return "redirect:/";
	}
}