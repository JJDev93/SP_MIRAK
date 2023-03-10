package kr.co.mirak.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CartService {
	List<CartVO> cartClientList(CartVO vo);
	List<CartVO> cartAdminList();
	CartVO info(int id);
	int insert(CartVO vo, HttpSession session);
	int update(CartVO vo);
	int delete(int id);
}
