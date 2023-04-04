package kr.co.mirak.pay.chart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ChartMapper {
	List<TotalByMenuVO> getTotalByMenuList(TotalByMenuVO vo);

	List<RatioByVO> getCountByGender(RatioByVO vo, @Param("clickedMenu") String clickedMenu);
	
	List<RatioByVO> getCountByAge(RatioByVO vo, @Param("clickedMenu") String clickedMenu);
	
	List<PurchaseRateVO> getPurchaseRateList(PurchaseRateVO vo);
	
	List<TotalUsersVO> getTotalUsersList(TotalUsersVO vo);
	
	List<ChartMainVO> getChartMainList(ChartMainVO vo);
	
	List<BestByGenderVO> getAgeTopFiveList(int param1, int param2);
}
