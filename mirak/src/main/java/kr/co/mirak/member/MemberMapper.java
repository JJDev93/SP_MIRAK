package kr.co.mirak.member;

import java.util.List;

public interface MemberMapper {
	MemberVO login(MemberVO vo);
	List<MemberVO> getMemberList();
	int createUser(MemberVO vo);
	MemberVO getMemberInfo(String memId);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
	int idCheck(String id);
}
