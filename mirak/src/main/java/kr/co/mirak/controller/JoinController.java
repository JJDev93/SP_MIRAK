
package kr.co.mirak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class JoinController {

//	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinview() {
		System.out.println("회원가입 화면으로 이동!");
		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinsuccess(MemberVO vo , Model model) {
		
//		sqlSessionTemplate.insert("member.join",vo);
		
		int success = memberService.createUser(vo);
		
		System.out.println("가입성공" );
		System.out.println(success);
		return "member/login";
	}
	
	//아이디 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@RequestParam("id") String id)  {
		
		int cnt = memberService.idCheck(id);

			if(cnt == 0) {
				System.out.println("사용불가능");
			}else if (cnt == 1) {
				System.out.println("사용가능");
			}
		
		return cnt;
	}
	
	
	
	
	
}







/*
 * @RequestMapping("/join") public String joinGET(Model model) {
 * logger.info("회원가입페이지입니다."); logger.info(model.toString()); return
 * "member/login";
 * 
 * }
 */
