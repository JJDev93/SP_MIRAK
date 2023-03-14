package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class AdminLoginController {	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value={"/admin"}, method=RequestMethod.GET)
	public String adminLoginGet() {
		System.out.println("어드민 로그인 화면으로 이동...");
		return "member/admin_login";
	}
	
	@RequestMapping(value={"/admin"}, method=RequestMethod.POST)
	public String adminLoginPost(MemberVO memberVO, HttpSession session) {
		try {
			memberService.login(memberVO);
			String mem_id = memberVO.getMem_id();
			if (mem_id != null) {
				session.setAttribute("mem_id", mem_id);
				if (mem_id.equals("admin")) {
					System.out.println("관리자 로그인 성공. 차트페이지로 이동.");
					return "redirect:/admin/members";
				}else{
					System.out.println("관리자가 아닙니다.");
					return "redirect:/";
				}
			} else {
				System.out.println("로그인 실패1");
				return "redirect:/admin";
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패2");
			return "redirect:/admin";
		}
	}
	
	// 로그아웃
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 성공!!");
		return "redirect:/";
	}
}