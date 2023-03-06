package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberServiceImpl implements MemberService{
	
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberServiceImpl() {}
	
	public MemberServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	

	public List<MemberVO> getMemberList() {
		MemberMapper mamberDAO = sqlSessionTemplate.getMapper(MemberMapper.class);
		List<MemberVO> memberList = mamberDAO.getMemberList();
		return memberList;
	}

}