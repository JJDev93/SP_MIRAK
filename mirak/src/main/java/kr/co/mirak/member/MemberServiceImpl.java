package kr.co.mirak.member;

import java.lang.reflect.Member;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberServiceImpl implements MemberService {

	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public MemberServiceImpl() {}
	
	public MemberServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.login(vo);
		return memVO;
	}
	
	public List<MemberVO> getMemberList() {
		MemberMapper mamberDAO = sqlSessionTemplate.getMapper(MemberMapper.class);
		List<MemberVO> memberList = mamberDAO.getMemberList();
		return memberList;
	}
	
	@Override
	public void createUser(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO MVO  = mapper.createUser(vo);
		return ;

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
