package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

public interface MemberMapper {
	MemberVO login(MemberVO vo);
	MemberVO info(int id);
	
	
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
	List<MemberVO> getMemberList();
}
