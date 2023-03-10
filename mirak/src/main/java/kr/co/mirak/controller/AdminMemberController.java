package kr.co.mirak.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class AdminMemberController {	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value={"/adminMembers", "/adminMembers/{pageStart}"}, method=RequestMethod.GET)
	public String getMemeberList(@PathVariable Optional<Integer> pageStart, Model model) {
		List<MemberVO> memberList = memberService.getMemberList(pageStart);
		model.addAttribute("memberList", memberList);
		return "member/admin_member_list";
	}
	
	@RequestMapping(value="/adminMember/{memId}", method=RequestMethod.GET)	
	public String getMemberDetail(@PathVariable String memId, Model model) {
		System.out.println("====== 어드민 상세페이지 ======");
		System.out.println("memId = " + memId);
		MemberVO member = memberService.getMemberDetail(memId);
		model.addAttribute("member", member);
		return "member/admin_member_detail";
	}
	
	// 로그아웃
	@RequestMapping("/adminLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 성공!!");
		return "redirect:/";
	}
}