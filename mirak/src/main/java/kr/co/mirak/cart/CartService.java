package kr.co.mirak.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CartService {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	CartVO info(int id);
	int cartInsert(CartVO vo, HttpSession session);
	
	// int cartUpdate(CartVO vo, HttpSession session);
	void cartUpdate(CartVO vo);
	
	void cartDelete(CartVO vo);
	
	/* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 목록(페이징 적용) */
    public List<CartVO> getListPaging(CriteriaC cri);
}