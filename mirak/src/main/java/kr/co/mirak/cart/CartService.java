package kr.co.mirak.cart;

import java.util.List;

public interface CartService {
	List<CartVO> list();
	CartVO info(int id);
	int insert(CartVO vo);
	int update(CartVO vo);
	int delete(int id);
}
