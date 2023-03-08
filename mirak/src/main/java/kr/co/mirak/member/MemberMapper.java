package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

public interface MemberMapper {
	MemberVO login(MemberVO vo);
	List<MemberVO> getMemberList();
	int createUser(MemberVO vo);
	MemberVO mypage(MemberVO vo);
	MemberVO getMemberDetail(MemberVO vo);
	
//	MemberVO info(int id);
//	int insert(MemberVO vo);
//	int delete(int id);
}
