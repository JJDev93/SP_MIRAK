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

	@Override
	public List<MemberVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO info(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}