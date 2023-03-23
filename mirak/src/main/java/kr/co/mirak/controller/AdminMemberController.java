package kr.co.mirak.controller;

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
	
	@RequestMapping(value="/admin/members/{curPage}", method=RequestMethod.GET)
	public String getMemeberList(MemberVO mvo,Model model, CriteriaM cri, @PathVariable("curPage") int curPage) {
		System.out.println("====== 관리자 회원 목록페이지로 이동 ======");
		model.addAttribute("memberList", memberService.getListPaging(cri));
		int total = memberService.getTotal(cri);
		PageMakerDTOM pageMake = new PageMakerDTOM(cri, total);
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("curPage", curPage);
		return "member/admin_member_list";
	}
	
	@RequestMapping(value="/admin/member/{curPage}/{mem_code}", method=RequestMethod.GET)	
	public String getMemberDetail(MemberVO mvo, Model model, @PathVariable("mem_code") String mem_code, @PathVariable("curPage") int curPage) {
		System.out.println("====== 관리자 회원 상세페이지로 이동 ======");
		mvo.setMem_code(Integer.parseInt(mem_code));
		model.addAttribute("member", memberService.adminMemberDetail(mvo));
		model.addAttribute("curPage", curPage);
		return "member/admin_member_detail";
	}
	
	@RequestMapping(value="/admin/memberUpdate/{curPage}/{mem_code}", method=RequestMethod.GET)	
	public String memberUpdatePage(MemberVO mvo, Model model, @PathVariable("mem_code") String mem_code, @PathVariable("curPage") int curPage) {
		System.out.println("====== 관리자 회원 수정페이지로 이동 ======");
		mvo.setMem_code(Integer.parseInt(mem_code));
		model.addAttribute("member", memberService.adminMemberDetail(mvo));
		model.addAttribute("curPage", curPage);
		return "member/admin_member_update";
	}
	
	@RequestMapping(value="/admin/memberUpdate/{curPage}/{mem_code}", method=RequestMethod.POST)	
	public String memberUpdate(MemberVO mvo, Model model, @PathVariable("mem_code") String mem_code, @PathVariable("curPage") int curPage) {
		System.out.println("====== 관리자 회원 수정 ======");
		model.addAttribute("member", memberService.adminMemberDetail(mvo));
		model.addAttribute("curPage", curPage);
		return "member/admin_member_update";
	}
}