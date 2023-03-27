package kr.co.mirak.pay.chart;

import java.util.List;
import java.util.Map;

public class ChartData {

	public Map<String, List<Object>> totalByMenuList;

	public Map<String, List<Object>> totalByMonthList;

	public Map<String, List<Object>> countByGender;

	public Map<String, List<Object>> countByAge;

	public Map<String, List<Object>> purchaseRateList;

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

	public Map<String, List<Object>> getCountByGender() {
		return countByGender;
	}

	public void setCountByGender(Map<String, List<Object>> countByGender) {
		this.countByGender = countByGender;
	}

	public Map<String, List<Object>> getCountByAge() {
		return countByAge;
	}

	public void setCountByAge(Map<String, List<Object>> countByAge) {
		this.countByAge = countByAge;
	}

	public Map<String, List<Object>> getPurchaseRateList() {
		return purchaseRateList;
	}

	public void setPurchaseRateList(Map<String, List<Object>> purchaseRateList) {
		this.purchaseRateList = purchaseRateList;
	}

}