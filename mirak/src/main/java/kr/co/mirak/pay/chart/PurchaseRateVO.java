package kr.co.mirak.pay.chart;

public class PurchaseRateVO {
	private String pro_name, rec;
	private int cart_cnt, cart_show;
	private double ratio;

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getRec() {
		return rec;
	}

	public void setRec(String rec) {
		this.rec = rec;
	}

	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}

	public int getCart_show() {
		return cart_show;
	}

	public void setCart_show(int cart_show) {
		this.cart_show = cart_show;
	}

	public double getRatio() {
		return ratio;
	}

	public void setRatio(double ratio) {
		this.ratio = ratio;
	}

	@Override
	public String toString() {
		return "PurchaseRateVO [pro_name=" + pro_name + ", rec=" + rec + ", cart_cnt=" + cart_cnt + ", cart_show="
				+ cart_show + ", ratio=" + ratio + "]";
	}

}
