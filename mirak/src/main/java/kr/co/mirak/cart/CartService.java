package kr.co.mirak.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mirak.member.MemberVO;

public interface CartService {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	CartVO info(int id);
	int cartInsert(CartVO vo, HttpSession session);
	
	// int cartUpdate(CartVO vo, HttpSession session);
	
	void cartUpdate(CartVO vo);
	void cartUpdateCheck(CartVO vo);
	void cartUpdateCheckAll(CartVO vo);
	
	void cartDelete(CartVO vo);
	
	/* 게시판 총 갯수 */
    public int getTotal();
//    public int getTotal(CriteriaC cri);
    
    /* 게시판 목록(페이징 적용) */
    public List<CartVO> getListPaging(CriteriaC cri);
    
    CartVO cartDetail(CartVO vo);
    
    void cartAdminDelete(CartVO vo);
    
    void cartAdminUpdate(CartVO vo);
    
    MemberVO adminMemberDetail2(MemberVO vo);
    

    
}