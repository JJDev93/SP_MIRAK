package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class AdminLoginController {	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping(value={"/admin"}, method=RequestMethod.GET)
	public String adminLoginGet() {
		System.out.println("어드민 로그인 화면으로 이동...");
		return "member/admin_login";
	}
	
	@RequestMapping(value={"/admin"}, method=RequestMethod.POST)
	public String adminLoginPost(MemberVO memberVO, HttpSession session) {
		System.out.println("=== 어드민 로그인 시도중 ===");
		String rawPw = memberVO.getMem_pw(); // 사용자가 제출한 비번
		String encodePw = ""; 
		memberVO.setMem_isapi("normal");
		System.out.println(memberVO);
		MemberVO lvo = memberService.login(memberVO);
		try {
			if (lvo != null) { 
				encodePw = lvo.getMem_pw(); 
				memberService.login(memberVO);
				System.out.println("제출한비번 :" + rawPw);		
				System.out.println("인코딩된비번 :" + encodePw);		
				String mem_id = memberVO.getMem_id();
				if (true == pwEncoder.matches(rawPw, encodePw) && mem_id.equals("admin")) {
					session.setAttribute("mem_id", mem_id);
					System.out.println("관리자 로그인 성공. 차트페이지로 이동.");
					return "redirect:/admin/charts";
					
				}
				System.out.println("관리자가 아닙니다.");
				return "redirect:/admin";
			} else {
				System.out.println("로그인 실패. 존재하지 않는 아이디입니다.");
				return "redirect:/admin";
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패.");
			return "redirect:/admin";
		}
	}
	
	// 로그아웃
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 성공!!");
		return "redirect:/admin";
	}
}