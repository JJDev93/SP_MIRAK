package kr.co.mirak.cart;

import java.util.List;

import kr.co.mirak.product.ProductVO;

public interface CartMapper {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	
	CartVO info(int id);
	int cartInsert(CartVO vo);
	
	void cartUpdate(CartVO vo);

	void cartDelete(CartVO vo);
	
	CartVO productToCart(CartVO vo);
	
}
