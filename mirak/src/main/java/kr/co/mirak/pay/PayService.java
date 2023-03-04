package kr.co.mirak.pay;

import java.util.List;

public interface PayService {	
	List<PayVO> list();
	PayVO info(int id);
	int insert(PayVO vo);
	int update(PayVO vo);
	int delete(int id);
}
