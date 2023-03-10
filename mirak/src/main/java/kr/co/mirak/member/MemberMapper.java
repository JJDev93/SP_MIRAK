package kr.co.mirak.member;

import java.util.List;

public interface MemberMapper {
	MemberVO login(MemberVO vo);
	int createUser(MemberVO vo);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
	List<MemberVO> getMemberList(Integer page);
	MemberVO getMemberInfo(String memId);
	int idCheck(String id);
	
	int memberCheck(MemberVO vo);
	
}
