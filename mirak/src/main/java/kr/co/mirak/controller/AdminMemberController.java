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

import kr.co.mirak.member.CriteriaM;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.member.PageMakerDTOM;


@Controller
public class AdminMemberController {	
	@Autowired
	private MemberService memberService;
	
//	@RequestMapping(value={"/adminMembers", "/adminMembers/{pageStart}"}, method=RequestMethod.GET)
//	public String getMemeberList(@PathVariable Optional<Integer> pageStart, Model model, CriteriaM cri) {
//		List<MemberVO> memberList = memberService.getMemberList(pageStart);
//		
//		model.addAttribute("memberList", memberList);
//
//		return "member/admin_member_list";
//	}
	
	@RequestMapping(value="/adminMembers", method=RequestMethod.GET)
	public String getMemeberList(MemberVO mvo,Model model, CriteriaM cri) {
		
		//김원중이 건드린 부분
		model.addAttribute("memberList", memberService.getListPaging(cri));
		
		
		int total = memberService.getTotal();

		PageMakerDTOM pageMake = new PageMakerDTOM(cri, total);

		model.addAttribute("pageMaker", pageMake);
		
		//여기까지 (매개변수에 Criteria 부분 추가했음-> 오류발생시 제거해야함!)
		
		
		return "member/admin_member_list";
	}

	// 상세 페이지
//	@RequestMapping(value="/adminMember/{memId}", method=RequestMethod.GET)	
//	public String getMemberDetail(@PathVariable String memId, Model model) {
//		System.out.println("====== 어드민 상세페이지 ======");
//		System.out.println("memId = " + memId);
//		MemberVO member = memberService.getMemberDetail(memId);
//		model.addAttribute("member", member);
//		return "member/admin_member_detail";
//	}
	
	@RequestMapping(value="/adminMember/{mem_id}", method=RequestMethod.GET)	
	public String getMemberDetail(MemberVO mvo, Model model) {
		System.out.println("====== 어드민 상세페이지 ======");
				
		model.addAttribute("member", memberService.getMemberDetail(mvo));
		
		memberService.getMemberDetail(mvo);
		
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