package kr.co.mirak.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class mypageController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private static final String MemberVO = null;
	
	//마이페이지 이동
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
	public String memupdate(MemberVO vo, Model model){
		memberService.memupdate(vo);
		System.out.println("회원정보 수정 완료...");
		return "redirect:mypage";
	}
	
	// 회원탈퇴
//	@RequestMapping(value="/memdelete", method = RequestMethod.POST)
//	public String memdelete(MemberVO vo, Model model, HttpSession session) {
//		try {
//			vo.setMem_id((String) session.getAttribute("mem_id"));
//			int success = memberService.memdelete(vo);
//			if (success == 0) {
//				model.addAttribute("message", "비밀번호 확인해주세요......");
//				return "redirect:mypage";
//			} else if (success == 1) {
//				return "redirect:/logout";
//			}
//		} catch (Exception e) {
//			model.addAttribute("message", "비밀번호 확인해주세요......");
//		}
//		return "redirect:mypage";
//	}
	
	//멤버 체크
	@RequestMapping(value = "/memberCheck", method = RequestMethod.POST)
	@ResponseBody
	public int memberCheck(MemberVO vo)throws Exception{
		int result = memberService.memberCheck(vo);
		return result;
	}
}










