package kr.co.mirak.member;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	//세션 값으로 회원 정보 확인
	public MemberVO getMemberInfo(HttpSession session){
		String myid = (String)session.getAttribute("mem_id");
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.getMemberInfo(myid);
		return memVO;
	}
	
	//ID값으로 회원 정보 확인
//	public MemberVO getMemberDetail(HttpSession session){
//		String myid = (String)session.getAttribute("mem_id");
//		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
//		MemberVO memVO  = mapper.getMemberInfo(myid);
//		return memVO;
//	}
	
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
	public int idCheck(String id) throws Exception{
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int result = mapper.idCheck(id);
		return result;
	}

	
	//어드민 회원상세정보
//	public MemberVO getMemberDetail(MemberVO vo){
//		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
//		MemberVO memVO  = mapper.getMemberDetail(vo);
//		return memVO;
//	}
}
