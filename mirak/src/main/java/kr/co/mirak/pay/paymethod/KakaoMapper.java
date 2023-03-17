package kr.co.mirak.pay.paymethod;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mirak.pay.PayVO;

public interface KakaoMapper {
	int insertOrder(PayKakaoVO payKakaoVO);

	PayKakaoVO selectTid(String mem_id);
	
	PayKakaoVO getTid(String group_id);
	
	int cancelStatus(String group_id);

	List<PayVO> selectOrderList(String mem_id);

	int updateOrderList(String mem_id);

	void insertPayList(List<PayVO> payList);

	int kakaoCancel(String mem_id);

}