package kr.co.mirak.member;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import kr.co.mirak.product.Criteria;


public interface MemberService {
	MemberVO login(MemberVO vo);
	MemberVO idfind(MemberVO vo);
	MemberVO idfind_pw(MemberVO vo);
	int createUser(MemberVO vo);
	int naverinsert(MemberVO vo);
	MemberVO getMemberInfo(HttpSession session);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
//	List<MemberVO> getMemberList(Optional<Integer> pageStart);
	MemberVO getMemberDetail(String memId);
	int idCheck(String id) throws Exception;

	//김원중이 건드린 부분
	
	/* 게시판 총 갯수 */
	public int getTotal();
	
	List<MemberVO> getListPaging(CriteriaM cri);
	
	MemberVO getMemberDetail(MemberVO mvo);
	
	//여기까지
	
	
	
	
	

}
