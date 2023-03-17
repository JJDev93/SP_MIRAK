package kr.co.mirak.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
	public String naverSave(MemberVO vo, HttpSession session) {
		System.out.println(vo);
		String result = null;
		try {
			if(vo != null) {
				int idCheck = memberService.idCheck(vo.getMem_id());
				if (idCheck == 0){
					memberService.createUser(vo);
					session.setAttribute("mem_id", vo.getMem_id());
					session.setAttribute("message","회원가입 성공하였습니다.");
					System.out.println("naverapi 회원가입 성공");
				}else if (idCheck == 1) {
					String mem_id = memberService.login(vo).getMem_id();
					session.setAttribute("mem_id", mem_id);
					session.setAttribute("message","로그인에 성공하였습니다.");
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

	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = memberService.getAccessToken(code);


		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));


		return "member/join";
	}



	/**
	 * 구글 로그인~!
	 * Authentication Code를 전달 받는 엔드포인트
	 **/
	@RequestMapping(value="/login/google/auth", method=RequestMethod.GET)
	public String googleAuth(Model model, @RequestParam(value = "code", required = false) String code, HttpServletResponse response) throws IOException {
		//Google OAuth Access Token 요청을 위한 파라미터 세팅
		System.out.println("authorize_code : " + code);
		String access_Token = snsLoginService.getGoogleAccessToken(code);

		HashMap<String, Object> googleUserInfo = snsLoginService.getGoogleUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + googleUserInfo.get("nickname"));
		System.out.println("###email#### : " + googleUserInfo.get("email"));

		PrintWriter out = response.getWriter();
		out.println("<script>window.close(); opener.parent.location="+"'/join'"+";</script>");
		out.flush();

		return "member/join";
	}	


}
