package kr.co.mirak.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.member.login.google.SnsLoginService;
import kr.co.mirak.member.login.naver.NaverLoginService;
import kr.co.mirak.member.login.naver.NaverUtils;

@Controller
public class apiController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SnsLoginService snsLoginService;
	@Autowired
	private NaverLoginService naverLoginService;

	@RequestMapping(value = "/naverLogin", method = RequestMethod.GET)
	public String naverLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String state = NaverUtils.generateRandomString();
		request.getSession().setAttribute("state", state);
		String naverAuthUrl = naverLoginService.getAuthorizationUrl(state);
		return "redirect:" + naverAuthUrl;
	}

	@RequestMapping(value = "/naverCallback", method = RequestMethod.GET)
	public String naverCallback(HttpSession session, Model model, @RequestParam String code, @RequestParam String state,
			HttpServletRequest request, MemberVO member) throws Exception {
		String sessionState = (String) session.getAttribute("state");
		if (!state.equals(sessionState)) {
			return "redirect:/login?error=invalid_request";
		} else {
			OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(request, code, state);
		   String accesstoken = oauthToken.getValue();
			String result = naverLoginService.getUserInfo(oauthToken, member);
			if (result.equals("login")) {
				session.setAttribute("accesstoken", accesstoken);
				session.setAttribute("mem_id", member.getMem_id());
				System.out.println("네이버 로그인했을떄 api는!!!!!!!!! : " + member.getMem_isapi());
				session.setAttribute("mem_isapi", member.getMem_isapi());
				session.setAttribute("message", "네이버 로그인 되었습니다!");
				return "redirect:/replayBefo";
			} else if (result.equals("join")) {
				session.setAttribute("accesstoken", accesstoken);
				session.setAttribute("mem_isapi", member.getMem_isapi());
				model.addAttribute("member", member);
				return "member/join";
			}
		}
		return "fail";
	}
	
	

	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(Model model, @RequestParam(value = "code", required = false) String code,
			HttpSession session) throws Exception {
		System.out.println("#########" + code);
		String access_Token = memberService.getAccessToken(code);

		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		String user_pw = (String) userInfo.get("id");
		String user_id = (String) userInfo.get("email");
		String user_name = (String) userInfo.get("nickname");
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id(user_id);
		memberVO.setMem_name(user_name);
		memberVO.setMem_pw(user_pw);
		memberVO.setMem_isapi("kakao");
		System.out.println("카카오 memberVO : " + memberVO);
		MemberVO lvo = memberService.login(memberVO);
		System.out.println("lvo : " + lvo);
		if (lvo == null) { // 회원가입
			System.out.println("카카오 회원가입!!!!!!!");
			model.addAttribute("member", memberVO);
			return "member/join";
		} else {
			session.setAttribute("mem_id", user_id);
			session.setAttribute("mem_isapi", memberVO.getMem_isapi());
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("message", "카카오 로그인 되었습니다!");
			memberService.login(memberVO);
			System.out.println("세션설정 mem_id : " + user_id);
			System.out.println("세션설정 mem_isapi : " + memberVO.getMem_isapi());
			return "redirect:/replayBefo";
		}
	}

	@RequestMapping(value = "/replayBefo", method = RequestMethod.GET)
	public String replayBefo(HttpSession session) {
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

	/**
	 * 구글 로그인~! Authentication Code를 전달 받는 엔드포인트
	 **/
	@RequestMapping(value = "/login/google/auth", method = RequestMethod.GET)
	public String googleAuth(Model model, @RequestParam(value = "code", required = false) String code,
			HttpServletResponse response, HttpSession session) throws IOException {
		HashMap<String, Object> token = snsLoginService.getGoogleAccessToken(code);
		String access_token = (String) token.get("access_token");

		HashMap<String, Object> googleUserInfo = snsLoginService.getGoogleUserInfo(access_token);

		String user_pw = (String) googleUserInfo.get("id");
		String user_id = (String) googleUserInfo.get("email");
		String user_name = (String) googleUserInfo.get("name");
		MemberVO member = new MemberVO();
		member.setMem_id(user_id);
		member.setMem_name(user_name);
		member.setMem_pw(user_pw);
		member.setMem_isapi("google");

		MemberVO lvo = memberService.login(member);
		if (lvo == null) { // 회원가입
			model.addAttribute("member", member);
			return "member/join";
		} else {
			session.setAttribute("mem_id", user_id);
			session.setAttribute("mem_isapi", member.getMem_isapi());
			session.setAttribute("access_Token", access_token);
			session.setAttribute("message", "구글 로그인 되었습니다!");
			memberService.login(member);
			System.out.println("세션설정 mem_id : " + user_id);
			System.out.println("세션설정 mem_isapi : " + member.getMem_isapi());
			return "redirect:/returnBefo";
		}
	}

	@RequestMapping(value = "/returnBefo", method = RequestMethod.GET)
	public String returnBefo(HttpSession session) {
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