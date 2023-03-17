package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

public class ChartData {

	public Map<String, List<Object>> totalByMenuList;

	public Map<String, List<Object>> totalByDayList;

	public Map<String, List<Object>> getTotalByMenuList() {
		return totalByMenuList;
	}

	public void setTotalByMenuList(Map<String, List<Object>> totalByMenuList) {
		this.totalByMenuList = totalByMenuList;
	}

	public Map<String, List<Object>> getTotalByDayList() {
		return totalByDayList;
	}

	public void setTotalByDayList(Map<String, List<Object>> totalByDayList) {
		this.totalByDayList = totalByDayList;
	}

}