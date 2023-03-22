package kr.co.mirak.cart;

import java.util.List;

import kr.co.mirak.product.ProductVO;


public interface CartMapper {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	
	CartVO info(int id);
	int cartInsert(CartVO vo);
	
	// int cartUpdate(CartVO vo);
	
	void cartUpdate(CartVO vo);
	void cartUpdateCheck(CartVO vo);
	void cartUpdateCheckAll(CartVO vo);

	void cartDelete(CartVO vo);
	
	CartVO productToCart(CartVO vo);
	
	/* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 목록(페이징 적용) */
    public List<CartVO> getListPaging(CriteriaC cri);	
	
    CartVO cartDetail(CartVO vo);
}