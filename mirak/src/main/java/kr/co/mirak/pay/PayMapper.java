package kr.co.mirak.pay;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductVO;

public interface PayMapper {
	List<PayVO> getAdminPayList(CriteriaP criP);
	
	List<ProductVO> getListPaging(PayVO cri);
	
	public int getTotal();

	List<PayVO> getClientPayList(String mem_id);
	
	List<PayVO> getPayListDetail(String group_id);
	
	int updateStatus(@Param("group_id") String group_id);
	
	List<PayVO> getProductInfo(String group_id);
	
	PayVO info(int id);
	
	int updateStatusConfirm(String group_id);

	int update(PayVO vo);

	int delete(int id);

	List<CartVO> cartCheckList(String mem_id);
}
