package kr.co.mirak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class AdminMemberController {	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/admin/member")
	public String getMemeberList(Model model) {
		List<MemberVO> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/admin_member_list";
	}

	@RequestMapping("/admin/member/detail")
	public String getMemeberDetail(Model model) {
		
		return "member/admin_member_detail";
	}
}