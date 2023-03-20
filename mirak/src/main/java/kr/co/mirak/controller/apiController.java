package kr.co.mirak.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.member.login.google.SnsLoginService;

@Controller
public class apiController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SnsLoginService snsLoginService;

	@RequestMapping(value="/naverSave", method=RequestMethod.POST)
	@ResponseBody
	public String naverSave(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		System.out.println(vo);
		String result = null;
		try {
			if(vo != null) {
				int idCheck = memberService.idCheck(vo.getMem_id());
				if (idCheck == 0){
					System.out.println("회원가입중");
					vo.setMem_isapi("naver");
					memberService.createUser(vo);
					session.setAttribute("mem_id", vo.getMem_id());
					rttr.addFlashAttribute("message", "회원가입 성공하였습니다.");
					System.out.println("naverapi 회원가입 성공");
				}else if (idCheck == 1) {
					String mem_id = memberService.login(vo).getMem_id();
					session.setAttribute("mem_id", mem_id);
					rttr.addFlashAttribute("message", "로그인에 성공하였습니다.");
					System.out.println("naverapi 로그인 완료!");
					result="loginsuccess";
				}
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return result;
	}

	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		System.out.println("#########" + code);
		String access_Token = memberService.getAccessToken(code);

		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		String user_pw = (String)userInfo.get("id");
		String user_id = (String)userInfo.get("email");
		String user_name = (String)userInfo.get("nickname");
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id(user_id);
		memberVO.setMem_name(user_name);
		memberVO.setMem_pw(user_pw);

		MemberVO lvo = memberService.login(memberVO);
		if(lvo == null) {

			memberService.createUser(memberVO);
		}
		session.setAttribute("mem_id", user_id);
		memberService.login(memberVO);

		return "member/join";
	}

	/**
	 * 구글 로그인~!
	 * Authentication Code를 전달 받는 엔드포인트
	 **/
	@RequestMapping(value="/login/google/auth", method=RequestMethod.GET)
	public String googleAuth(Model model, @RequestParam(value = "code", required = false) String code, HttpServletResponse response, HttpSession session) throws IOException {
		HashMap<String, Object> token = snsLoginService.getGoogleAccessToken(code);
		String access_token = (String)token.get("access_token");
		
		HashMap<String, Object> googleUserInfo = snsLoginService.getGoogleUserInfo(access_token);
		
		String user_pw = (String)googleUserInfo.get("id");
		String user_id = (String)googleUserInfo.get("email");
		String user_name = (String)googleUserInfo.get("name");
		MemberVO member = new MemberVO();
		member.setMem_id(user_id);
		member.setMem_name(user_name);
		member.setMem_pw(user_pw);
		member.setMem_isapi("google");

		MemberVO lvo = memberService.login(member);
		if(lvo == null) { //회원가입
			model.addAttribute("member", member);
			return "member/join";
		}else {
			session.setAttribute("mem_id", user_id);
			session.setAttribute("access_Token", access_token);
			memberService.login(member);
			System.out.println("세션설정 mem_id : " + user_id);
			return "redirect:/returnBefo";
		}
	} 

	@RequestMapping(value="/returnBefo", method=RequestMethod.GET)
	public String returnBefo(HttpSession session){
		String preUrl = (String) session.getAttribute("pre_url"); 
		String returnURL = "";
		System.out.println("preUrl : " + preUrl);
		if (preUrl != null) {
			System.out.println("이전 페이지로 이동"); 
			returnURL = "redirect:" + preUrl;
		} else {
			System.out.println("메인으로 이동"); 
			returnURL = "redirect:/"; 
		} 
		return returnURL;
	} 

}