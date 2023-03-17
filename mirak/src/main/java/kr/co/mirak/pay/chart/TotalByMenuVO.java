package kr.co.mirak.pay.chart;

public class TotalByMenuVO {
	private String menu;
	private int total;
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "TotalByMenuVO [menu=" + menu + ", total=" + total + "]";
	}
	
}
