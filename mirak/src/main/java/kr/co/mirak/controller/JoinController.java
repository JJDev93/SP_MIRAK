package kr.co.mirak.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원 가입 페이이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinview(HttpSession session) {
		System.out.println("회원가입 화면으로 이동!");
		String preUrl = (String) session.getAttribute("pre_url");
		System.out.println("preUrl : " + preUrl);

		return "member/join";
	}

	// api 회원가입 페이지 이동
	@RequestMapping(value = "/apiJoin", method = RequestMethod.GET)
	public String joinview(MemberVO vo) {
		System.out.println("API 회원가입 화면으로 이동!");
		System.out.println(vo);
		return "member/join";
	}

	// 아이디 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String id, String isApi) throws Exception {
		int result = memberService.existIdAndIsApi(id, isApi);
		if (result == 0) {
			return "success";
		} else {
			// 동일한 계정으로 아이디가 있다 하면댐
			return "fail";
		}
	}

	// 회원가입 기능
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joincuccess(MemberVO vo, String id, HttpSession session) throws Exception {

		try {
			// 암호화 1

			String rawPw = ""; // 인코딩 전 비밀번호
			String encodePw = ""; // 인코딩 후 비밀번호

			rawPw = vo.getMem_pw(); // 비밀번호 데이터 얻음
			encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
			vo.setMem_pw(encodePw); // 인코딩된 비밀번호 vo객체에 다시 저장

			// 회원 가입 쿼리 실행
			memberService.createUser(vo);
			session.setAttribute("message", "회원가입 성공하였습니다!");
			String mem_id = vo.getMem_id();
			session.setAttribute("mem_id", mem_id); // 세션에 사용자정보 저장

			session.setAttribute("mem_isapi", vo.getMem_isapi()); // 세션에 사용자정보 저장
			System.out.println("세션에 isapi저장!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String preUrl = (String) session.getAttribute("pre_url");
			String returnURL = "";

			System.out.println("preUrl : " + preUrl);

			if (preUrl != null) {
				System.out.println("가입성공");
				returnURL = "redirect:" + preUrl;
				session.removeAttribute("pre_url");
				return returnURL;
			} else {
				System.out.println("메인으로 이동");
				returnURL = "redirect:/";
			}
		} catch (DuplicateKeyException e) {
			session.setAttribute("message", "중복된 아이디 입니다.");
			return "member/join";
		}
		return "redirect:/";
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email, String reset) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("이메일 : " + email);
		String title, content, num;
		Random random = new Random(); /* 인증번호(난수) 생성 */
		if (reset != null) {
			String specialChars = "!@#$%^&*()_+{}[]<>?";
			int stringLength = random.nextInt(7) + 6;

			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < stringLength; i++) {
				double charValue = Math.random();
				if (charValue < 0.5) {
					sb.append(String.valueOf((char) ((charValue * 26) + 65))); // uppercase letter
				} else {
					sb.append(specialChars.charAt(random.nextInt(specialChars.length()))); // special character
				}
			}
			String randomString = sb.toString();
			System.out.println(randomString);

			System.out.println("임시 비밀번호 : " + randomString);
			title = "비밀번호 재설정 이메일 입니다.";
			content = "MiRrk에 방문해주셔서 감사합니다." + "<br><br>" + "임시비밀번호는 " + randomString + "입니다." + "<br>"
					+ "로그인후 마이페이지에서 비밀번호를 수정해주세요.";
			num = randomString;
		} else {

			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			title = "회원가입 인증 이메일 입니다.";
			content = "MiRrk에 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			num = Integer.toString(checkNum);
		}
		/* 이메일 보내기 */
		String setFrom = "acj119@naver.com";
		String toMail = email;

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return num;
	}
}
