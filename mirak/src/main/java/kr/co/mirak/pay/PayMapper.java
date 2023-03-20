package kr.co.mirak.pay;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductVO;

public interface PayMapper {
	List<PayVO> getAdminPayList(CriteriaP criP);
	
	List<ProductVO> getListPaging(PayVO cri);
	
	int getTotal(CriteriaP criP);

	List<PayVO> getClientPayList(String mem_id);
	
	List<PayVO> getPayListDetail(String group_id);
	
	int updateStatus(@Param("pay_code") int pay_code, @Param("group_id") String group_id);
	
	List<PayVO> getProductInfo(String group_id);
	
	PayVO info(int id);

	int insert(PayVO vo);

	int update(PayVO vo);

	int delete(int id);

	List<CartVO> cartCheckList(String mem_id);
}
