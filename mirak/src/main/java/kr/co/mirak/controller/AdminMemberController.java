package kr.co.mirak.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.member.CriteriaM;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.member.PageMakerDTOM;


@Controller
public class AdminMemberController {	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/admin/members", method=RequestMethod.GET)
	public String getMemeberList(MemberVO mvo,Model model, CriteriaM cri) {
		model.addAttribute("memberList", memberService.getListPaging(cri));
		int total = memberService.getTotal(cri);
		PageMakerDTOM pageMake = new PageMakerDTOM(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "member/admin_member_list";
	}
	
	@RequestMapping(value="/admin/member/{mem_code}", method=RequestMethod.GET)	
	public String getMemberDetail(MemberVO mvo, Model model, @PathVariable("mem_code") String mem_code) throws UnsupportedEncodingException {
		System.out.println("====== 어드민 상세페이지 ======");
		System.out.println(mem_code);
		model.addAttribute("member", memberService.getMemberDetail(mem_code));
		mvo.toString();
		return "member/admin_member_detail";
	}
}