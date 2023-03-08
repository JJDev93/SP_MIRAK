package kr.co.mirak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class AdminMemberController {	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/admin/members", method=RequestMethod.GET)
	public String getMemeberList(Model model) {
		List<MemberVO> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/admin_member_list";
	}
	
	@RequestMapping(value="/admin/members/{pageInfo}", method=RequestMethod.GET)
	public String getMemeberList(@PathVariable int pageInfo, Model model) {
		List<MemberVO> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/admin_member_list";
	}

	@RequestMapping(value="/admin/members/{member}", method=RequestMethod.GET)
	public String getMemeberDetail(@PathVariable String member, Model model) {
		System.out.println("찾으려는 멤버 id = " + member);
		return "member/admin_member_detail";
	}
	
	// 로그아웃
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		System.out.println("로그아웃 성공!!");
		return "redirect:/";
	}
	
//	//인덱스
//	@RequestMapping("/admin")
//	public String index() {
//		System.out.println("인덱스 이동...");
//		return "/";
//	}
}