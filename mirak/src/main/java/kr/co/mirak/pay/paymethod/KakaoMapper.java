package kr.co.mirak.pay.paymethod;

public interface KakaoMapper {
	int insertOrder(PayKakaoVO payKakaoVO);
	PayKakaoVO selectTid(String mem_id);
	int kakaoCancel(String mem_id);
}
