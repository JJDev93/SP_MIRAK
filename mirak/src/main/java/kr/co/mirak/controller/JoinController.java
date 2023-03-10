
package kr.co.mirak.controller;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
/*
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinsuccess(MemberVO vo , Model model) {
		
//		sqlSessionTemplate.insert("member.join",vo);
		
		int success = memberService.createUser(vo);
		
		System.out.println("가입성공" );
		System.out.println(success);
		return "member/login";
	}
	
*/	
	//아이디 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String id)throws Exception{
		int result = memberService.idCheck(id);
		return result;
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joincuccess(MemberVO vo , String id) throws Exception{
		int idResult = memberService.idCheck(id);
		
		try {
			if(idResult == 1) {
				return "/join";
			}else if(idResult == 0) {
				memberService.createUser(vo);
				System.out.println("가입성공");
//				return "member/login";
			}
		}catch (Exception e) {
			throw new RuntimeException();
		}
		return "member/login";
	}	
	
}



