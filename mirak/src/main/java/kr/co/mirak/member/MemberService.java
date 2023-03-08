package kr.co.mirak.member;

import java.util.List;

public interface MemberService {
	MemberVO login(MemberVO vo);
	List<MemberVO> getMemberList();
	int createUser(MemberVO vo);
	MemberVO mypage(MemberVO vo);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
	MemberVO getMemberDetail(MemberVO vo);
	
//	MemberVO info(int id);
//	int insert(MemberVO vo);
//	int delete(int id);
}
