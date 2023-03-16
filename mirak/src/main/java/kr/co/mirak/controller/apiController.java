package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class apiController {
	@Autowired
	private MemberService memberService;
    
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
				 
		}catch(Exception e) {
			throw new RuntimeException();
		}
	    return result;
	}
}