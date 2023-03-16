package kr.co.mirak.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductVO;

public interface PayService {	
	List<PayVO> getAdminPayList();
	List<PayVO> getPayListDetail(String group_id);
	PayVO info(int id);
	int insert(PayVO vo);
	int update(PayVO vo);
	int delete(int id);
	List<CartVO> cartCheckList(HttpSession session);
	List<PayVO> adaptPayVO(PayStringVO payStringVO, HttpSession session);
	List<ProductVO> payFromProduct(ProductVO productVO, String cart_cnt);
}
