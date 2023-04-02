package kr.co.mirak.pay.paymethod;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import kr.co.mirak.pay.PayVO;

public interface KakaoMapper {
	int insertOrder(PayKakaoVO payKakaoVO);

	PayKakaoVO selectTid(@Param("mem_id")String mem_id, @Param("mem_isapi")String mem_isapi);
	
	PayKakaoVO getTid(String group_id);
	
	int cancelStatus(String group_id);

	List<PayVO> selectOrderList(@Param("mem_id")String mem_id, @Param("mem_isapi")String mem_isapi);

	int updateOrderList(@Param("mem_id")String mem_id, @Param("mem_isapi")String mem_isapi);

	void insertPayList(List<PayVO> payList);

	int kakaoCancel(String mem_id);

}