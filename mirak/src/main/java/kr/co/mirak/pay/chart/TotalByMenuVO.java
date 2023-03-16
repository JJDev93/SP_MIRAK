package kr.co.mirak.pay.chart;

public class TotalByMenuVO {
	private String pro_name;
	private int totalPrice;
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "TotalByMenuVO [pro_name=" + pro_name + ", totalPrice=" + totalPrice + "]";
	}
}
