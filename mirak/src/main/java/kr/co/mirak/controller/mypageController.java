package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class mypageController {
	@Autowired
	private MemberService memberService;
	
	// 마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageview(Model model, HttpSession session) {
		System.out.println("마이페이지로 이동..");

		MemberVO member = memberService.getMemberInfo(session);
//		model.addAttribute("message", message);
		model.addAttribute("member", member);
		System.out.println(member);
		return "member/mypage";
	}

	// 회원정보 수정
	@RequestMapping(value = "/memupdate", method = RequestMethod.POST)
	public String memupdate(MemberVO vo, Model model) {
		memberService.memupdate(vo);
		System.out.println("회원정보 수정 완료...");
		return "redirect:mypage";
	}

	// 회원탈퇴
	@RequestMapping(value="/memdelete", method = RequestMethod.POST)
	@ResponseBody
	public int memdelete(MemberVO vo, HttpSession session) {
		System.out.println("memberVO :" + vo);
		int success = memberService.memdelete(vo);
		session.invalidate();
		return success;
	}
}
