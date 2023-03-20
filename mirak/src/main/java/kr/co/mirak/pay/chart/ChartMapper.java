package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

import kr.co.mirak.pay.PayVO;

public interface ChartMapper {
	List<TotalByMenuVO> getTotalByMenuList(TotalByMenuVO vo);
	
	List<TotalByDayVO> getTotalByDayList(TotalByDayVO vo);

}
