package kr.co.mirak.pay.chart;

public class ChartMainVO {
	private int totalPrice, monthPrice, totalUsers;

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getMonthPrice() {
		return monthPrice;
	}

	public void setMonthPrice(int monthPrice) {
		this.monthPrice = monthPrice;
	}

	public int getTotalUsers() {
		return totalUsers;
	}

	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}

	@Override
	public String toString() {
		return "ChartMainVO [totalPrice=" + totalPrice + ", monthPrice=" + monthPrice + ", totalUsers=" + totalUsers
				+ "]";
	}
}
