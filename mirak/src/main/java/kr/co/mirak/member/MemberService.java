package kr.co.mirak.member;

import java.util.List;

public interface MemberService {
	MemberVO login(MemberVO vo);
	MemberVO info(int id);
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
	List<MemberVO> getMemberList();
}
