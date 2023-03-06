package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

public interface MemberMapper {
	List<MemberVO> getMemberList();
	MemberVO info(int id);
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
}
