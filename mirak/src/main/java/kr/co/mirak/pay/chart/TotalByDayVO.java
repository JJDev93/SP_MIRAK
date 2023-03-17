package kr.co.mirak.pay.chart;

public class TotalByDayVO {
	private String order_date;
	private int total;
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "TotalByDayVO [order_date=" + order_date + ", total=" + total + "]";
	}
	
}
