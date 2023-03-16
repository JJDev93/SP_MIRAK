package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

import kr.co.mirak.pay.PayVO;

public interface ChartMapper {
	List<PayVO> list();

	int statUpdate(PayVO vo);

	List<TotalByMenuVO> getTotalByMenuList(TotalByMenuVO vo);
	
	List<TotalByDayVO> getTotalByDayList(TotalByDayVO vo);

}
