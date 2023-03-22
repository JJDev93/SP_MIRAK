package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

public class ChartData {

	public Map<String, List<Object>> totalByMenuList;

	public Map<String, List<Object>> totalByMonthList;

	public Map<String, List<Object>> getTotalByMenuList() {
		return totalByMenuList;
	}

	public void setTotalByMenuList(Map<String, List<Object>> totalByMenuList) {
		this.totalByMenuList = totalByMenuList;
	}

	public Map<String, List<Object>> getTotalByMonthList() {
		return totalByMonthList;
	}

	public void setTotalByMonthList(Map<String, List<Object>> totalByMonthList) {
		this.totalByMonthList = totalByMonthList;
	}

}