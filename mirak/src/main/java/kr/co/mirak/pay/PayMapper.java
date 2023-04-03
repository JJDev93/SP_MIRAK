package kr.co.mirak.pay;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductVO;

public interface PayMapper {
	List<PayVO> getAdminPayList(CriteriaP criP);
	
	public int getTotal();

	List<PayVO> getClientPayList(@Param("mem_id")String mem_id, @Param("mem_isapi")String mem_isapi);
	
	List<PayVO> getPayListDetail(String group_id);
	
	int updatePayments(PayVO payVO);
	
	List<PayVO> getProductInfo(String group_id);
	
	PayVO info(int id);
	
	int updateStatusConfirm(String group_id);
	
	int updateDetailInfo(PayVO payVO);

	int update(PayVO vo);

	int delete(int id);

	List<CartVO> cartCheckList(String mem_id);
}
