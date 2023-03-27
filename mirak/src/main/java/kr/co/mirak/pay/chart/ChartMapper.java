package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.mirak.pay.PayVO;

public interface ChartMapper {
	List<TotalByMenuVO> getTotalByMenuList(TotalByMenuVO vo);

	List<RatioByVO> getCountByGender(RatioByVO vo, @Param("clickedMenu") String clickedMenu);
	
	List<RatioByVO> getCountByAge(RatioByVO vo, @Param("clickedMenu") String clickedMenu);

	List<TotalByDayVO> getTotalByMonthList(TotalByDayVO vo);

	List<TotalByDayVO> getTotalByDayList(TotalByDayVO vo, @Param("clickedMonth") String clickedMonth);

}
