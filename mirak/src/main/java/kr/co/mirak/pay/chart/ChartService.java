package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

public interface ChartService {
	Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo);

	Map<String, List<Object>> getCountByGender(RatioByVO vo, String clickedMenu);

	Map<String, List<Object>> getCountByAge(RatioByVO vo, String clickedMenu);

	Map<String, List<Object>> getPurchaseRateList(PurchaseRateVO vo);
	
	Map<String, Map<String, List<Object>>> getTotalUsersList(TotalUsersVO vo);
	
	Map<String, List<Object>> getChartMainList(ChartMainVO vo);
	
	Map<String, Map<String, List<Object>>> getAgeTopFiveList(BestByGenderVO bvo);

}
