package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	

	// 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(Model model) {
		System.out.println("로그인 화면으로 이동...");
		return "member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, Model model, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + "[" + memberVO.getMem_id() + " , " + memberVO.getMem_pw()+ "]");
		
		
		/* 암호화부분 */

		HttpSession session = request.getSession();
		
		String rawPw = "";
		String encodePw = "";

		MemberVO lvo = memberService.login(memberVO); // 제출한아이디와 일치하는 아이디있는지

		
		if (lvo != null) { // 일치하는 아이디 존재시

			rawPw = memberVO.getMem_pw(); // 사용자가 제출한 비번
			encodePw = lvo.getMem_pw(); // db에 저장한 인코딩된 비번
			
			System.out.println("제출한비번:" + rawPw);
			System.out.println("인코딩된비번:" + lvo.getMem_pw());
			
			String mem_id;
			
			if (true == pwEncoder.matches(rawPw, encodePw)) {  // 비번 일치 여부 판단
//				logger.info("일로오나");
				memberVO.setMem_pw("");   //인코딩된 비번 정보 지움
				mem_id = memberVO.getMem_id();
				
			
				
				session.setAttribute("mem_id", mem_id); //세션에 사용자정보 저장 
				logger.info("로그인 성공");
				return "redirect:/";  //메인페이지로 이동

			} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

				rttr.addFlashAttribute("result", 0);
				logger.info("일치하는 아이디가 없습니다");
				return "member/login"; // 로그인 페이지로 이동
			}
		} else {   //일치하는 아이디가 존재하지 않을시 (로그인 실패)
			
			rttr.addFlashAttribute("result" , 0);
			logger.info("로그인 실패");
			return "member/login";  //로그인페이지로 이동
		}
	
	}
	
		
		
/*
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

*/

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		System.out.println("로그아웃 성공!!");
		return "redirect:/";
	}
	
	// 아이디찾기 
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String idfindform() {
		System.out.println("아이디 찾기이동..");
		return "member/idfind";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/idfind", method = RequestMethod.POST)
	public String idfind(MemberVO vo, HttpSession session, Model model) {
		String returnURL = "member/idfind";
		String preUrl = (String) session.getAttribute("pre_url");
		System.out.println("preUrl : " + preUrl);
		
		try {
		MemberVO member = memberService.idfind(vo);
		model.addAttribute("member", member);
		System.out.println(member);
		
			if (member.getMem_id() != null) {
				model.addAttribute("mem_id", member.getMem_id());
				System.out.println(member.getMem_id());
				if (preUrl != null) {
					System.out.println("이전 페이지로 이동");
					returnURL = "member/idfind" + preUrl;
					session.removeAttribute("pre_url");
				} else {
					returnURL = "member/idfind";
				}
			} 
		}catch (Exception e) {
			returnURL = "member/idfind";
			model.addAttribute("message", "정보를 다시 입력해주세요....");
		}
		return returnURL;
	}
	
	// 비번재설정
		@RequestMapping(value = "/pwreset", method = RequestMethod.GET)
		public String pwresetform() {
			System.out.println("비번 재설정기이동..");
			return "member/pwreset";
		}

		// 비번재설정
		@RequestMapping(value = "/pwreset", method = RequestMethod.POST)
		public String pwreset(MemberVO vo, HttpSession session, Model model) {
			String returnURL = "member/idfind";
			String preUrl = (String) session.getAttribute("pre_url");
			System.out.println("preUrl : " + preUrl);
			
			try {
			String mem_id = memberService.idfind_pw(vo).getMem_id();
			System.out.println(vo);
			System.out.println(mem_id);
			
			if (mem_id != null) {
				model.addAttribute("mem_id", mem_id);
				if (preUrl != null) {
					System.out.println("이전 페이지로 이동");
					returnURL = "member/pwreset" + preUrl;
					session.removeAttribute("pre_url");
				} else {
					returnURL = "member/pwreset";
				}
			}
		} catch (Exception e) {
			returnURL = "member/pwreset";
			model.addAttribute("message", "정보를 다시 입력해주세요....");
		}
			return returnURL;
		}
		
}