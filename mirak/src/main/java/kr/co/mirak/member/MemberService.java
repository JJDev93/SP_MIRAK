package kr.co.mirak.member;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

public interface MemberService {
	MemberVO login(MemberVO vo);
	int createUser(MemberVO vo);
	MemberVO getMemberInfo(HttpSession session);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
	List<MemberVO> getMemberList(Optional<Integer> pageStart);
	MemberVO getMemberDetail(String memId);
	int idCheck(String id) throws Exception;
	int memberCheck(MemberVO vo);;




}
