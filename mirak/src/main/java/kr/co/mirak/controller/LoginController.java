package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(Model model) {
		System.out.println("로그인 화면으로 이동...");
		return "member/login";
	}

	// 로그인

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpSession session, Model model) {

		System.out.println("로그인을 시도합니다.");
		String returnURL = "";
		String preUrl = (String) session.getAttribute("pre_url");
		System.out.println("preUrl : " + preUrl);

		try {
			String mem_id = memberService.login(memberVO).getMem_id();
			if (mem_id != null) {
				session.setAttribute("mem_id", mem_id);

				System.out.println("로그인 성공!");
				if (preUrl != null) {
					System.out.println("이전 페이지로 이동");
					returnURL = "redirect:" + preUrl;

				} else {

					System.out.println("메인으로 이동");
					returnURL = "redirect:/";
				}
			} else {
				System.out.println("로그인 실패ㅠ 로그인 페이지로 이동");
				returnURL = "member/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
			returnURL = "member/login";
			model.addAttribute("message", "아이디와 비밀번호 확인해주세요......");
		}
		session.removeAttribute("pre_url");
		return returnURL;
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(HttpServletRequest request, MemberVO member, RedirectAttributes rttr)
	 * throws Exception{
	 * 
	 * 
	 * 
	 * HttpSession session = request.getSession(); String rawPw = ""; String
	 * encodePw = "";
	 * 
	 * MemberVO lvo = memberService.login(member); // 제출한아이디와 일치하는 아이디 있는지
	 * 
	 * if(lvo != null) { // 일치하는 아이디 존재시
	 * 
	 * rawPw = member.getMem_pw(); // 사용자가 제출한 비밀번호 encodePw = lvo.getMem_pw(); //
	 * 데이터베이스에 저장한 인코딩된 비밀번호
	 * 
	 * if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단
	 * 
	 * lvo.setMem_pw(""); // 인코딩된 비밀번호 정보 지움 session.setAttribute("member", lvo); //
	 * session에 사용자의 정보 저장 return "redirect:/"; // 메인페이지 이동
	 * 
	 * 
	 * } else {
	 * 
	 * rttr.addFlashAttribute("result", 0); return "redirect:member/login"; // 로그인
	 * 페이지로 이동
	 * 
	 * }
	 * 
	 * } else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
	 * 
	 * rttr.addFlashAttribute("result", 0); return "redirect:member/login"; // 로그인
	 * 페이지로 이동
	 * 
	 * } }
	 * 
	 */

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		System.out.println("로그아웃 성공!!");
		return "redirect:/";
	}
}