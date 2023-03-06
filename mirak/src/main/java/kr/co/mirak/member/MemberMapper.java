package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

public interface MemberMapper {
	List<MemberVO> getMemberList();
}
