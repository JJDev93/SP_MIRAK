
package kr.co.mirak.member;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.mirak.product.Criteria;

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
	
	//아이디 찾기
	public MemberVO idfind(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.idfind(vo);
		return memVO;
	}
	
	//아이디 찾기(비번 리셋용)
	public MemberVO idfind_pw(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.idfind(vo);
		return memVO;
	}
	
	//회원가입
	@Override
	public int createUser(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int success  = mapper.createUser(vo);
		return success;
	}
	@Override
	public int naverinsert(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int success  = mapper.naverinsert(vo);
		return success;
	}
	//세션 값으로 회원 정보 확인
	public MemberVO getMemberInfo(HttpSession session){
		String myid = (String)session.getAttribute("mem_id");
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.getMemberInfo(myid);
		return memVO;
	}
	
	public int memupdate(MemberVO vo) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int updatesuccess  = mapper.memupdate(vo);
		return updatesuccess;
	}

	@Override
	public int memdelete(MemberVO vo){
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int seccess = mapper.memdelete(vo);
		return seccess;	
	}
	

	//아이디체크
	@Override
	public int idCheck(String id) throws Exception{
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		int result = mapper.idCheck(id);
		return result;
	}

	
	//ADMIN 리스트
//	public List<MemberVO> getMemberList(Optional<Integer> pageStart) {
//		int page;
//		if (pageStart.isPresent()) {
//			page = pageStart.get();
//	    }else {
//	    	page = 0;
//	    }
//		page=page*10;
//		MemberMapper mamberDAO = sqlSessionTemplate.getMapper(MemberMapper.class);
//		List<MemberVO> memberList = mamberDAO.getMemberList(page);
//		System.out.println(page+"페이지로 이동");
//		return memberList;
//	}
	
	
	
	//ADMIN ID값으로 회원 정보 확인
	public MemberVO getMemberDetail(String memId){
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		MemberVO memVO  = mapper.getMemberInfo(memId);
		return memVO;
	}
	
	//김원중이 건드린 부분
	
	public int getTotal() {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		return mapper.getTotal();
	}
	
	public List<MemberVO> getListPaging(CriteriaM cri) {
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		return mapper.getListPaging(cri);
	}
	
	public MemberVO getMemberDetail(MemberVO mvo) {
		
		MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
		return mapper.getMemberDetail(mvo);
		
	}
	
	

	//여기까지
	
	

}
