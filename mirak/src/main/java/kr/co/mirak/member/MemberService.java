package kr.co.mirak.member;

import java.util.List;

public interface MemberService {
	List<MemberVO> list();
	MemberVO info(int id);
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
	
	
	

}
