package kr.co.mirak.member;

import java.util.List;

import kr.co.mirak.product.Criteria;


public interface MemberMapper {
	MemberVO login(MemberVO vo);
	int createUser(MemberVO vo);
	int memupdate(MemberVO vo);
	int memdelete(MemberVO vo);
//	List<MemberVO> getMemberList(Integer page);
	MemberVO getMemberInfo(String memId);
	int idCheck(String id);
	int memberCheck(MemberVO vo);
	
	// 김원중이 건드린 부분
	
	/* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 목록(페이징 적용) */
    public List<MemberVO> getListPaging(CriteriaM cri);
    
    MemberVO getMemberDetail(MemberVO mvo);
    
    
    
    // 여기까지!
    
    
	
}
