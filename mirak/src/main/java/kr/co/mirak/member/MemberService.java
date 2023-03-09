package kr.co.mirak.member;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberService {
	MemberVO login(MemberVO vo);
	List<MemberVO> getMemberList();
	int createUser(MemberVO vo);
	MemberVO getMemberInfo(HttpSession session);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
}
