package kr.co.mirak.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mirak.cart.CartVO;

public interface PayService {	
	List<PayVO> list();
	PayVO info(int id);
	int insert(PayVO vo);
	int update(PayVO vo);
	int delete(int id);
	List<CartVO> cartCheckList(HttpSession session);
	List<PayVO> adaptPayVO(PayStringVO payStringVO, HttpSession session);
	
}
