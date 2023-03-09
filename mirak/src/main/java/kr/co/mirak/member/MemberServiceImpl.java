package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberServiceImpl implements MemberService {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberServiceImpl() {}
	
	public MemberServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//로그인
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.login(vo);
		return memVO;
	}
	
	//admin list
	public List<MemberVO> getMemberList() {
		MemberMapper mamberDAO = sqlSessionTemplate.getMapper(MemberMapper.class);
		List<MemberVO> memberList = mamberDAO.getMemberList();
		return memberList;
	}
	
	//회원가입
	@Override
	public int createUser(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int success  = mapper.createUser(vo);
		return success;
	}
	
	//회원 정보 확인
	public MemberVO getMemberInfo(MemberVO vo){
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.getMemberInfo(vo);
		return memVO;
	}
	
	public int memupdate(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int updatesuccess  = mapper.memupdate(vo);
		return updatesuccess;
	}
	
	public int memdelete(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int deletesuccess  = mapper.memdelete(vo);
		return deletesuccess;
	}

	//아이디체크
	@Override
	public int idCheck(String id) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int cnt = mapper.idCheck(id);
		return cnt;
	}
}
