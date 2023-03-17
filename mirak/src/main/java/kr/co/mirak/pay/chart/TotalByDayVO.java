package kr.co.mirak.pay.chart;

public class TotalByDayVO {
	private String pay_date;
	private int totalPrice;
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "TotalByDayVO [pay_date=" + pay_date + ", totalPrice=" + totalPrice + "]";
	}
	
}
