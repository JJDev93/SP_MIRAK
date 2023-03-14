package kr.co.mirak.cart;

import java.util.List;

public interface CartMapper {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	
	CartVO info(int id);
	int cartInsert(CartVO vo);
	int cartUpdate(CartVO vo);
	int cartDelete(CartVO vo);
	
	CartVO productToCart(CartVO vo);
	
}
