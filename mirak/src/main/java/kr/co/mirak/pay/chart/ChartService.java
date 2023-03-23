package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

public interface ChartService {
	Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo);

	Map<String, List<Object>> getTotalByMonthList(TotalByDayVO vo);

	Map<String, List<Object>> getTotalByDayList(TotalByDayVO vo, String clickedMonth);

	Map<String, List<Object>> getTotalByEachMenu(TotalByDayVO vo, String clickedMenu);

}
