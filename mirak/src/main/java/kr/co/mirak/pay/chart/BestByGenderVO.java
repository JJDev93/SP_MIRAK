package kr.co.mirak.pay.chart;

public class BestByGenderVO {
	private String pro_name;
	private double ratio;
	private int total_Price;

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public double getRatio() {
		return ratio;
	}

	public void setRatio(double ratio) {
		this.ratio = ratio;
	}

	public int getTotal_Price() {
		return total_Price;
	}

	public void setTotal_Price(int total_Price) {
		this.total_Price = total_Price;
	}

	@Override
	public String toString() {
		return "BestByGenderVO [pro_name=" + pro_name + ", ratio=" + ratio + ", total_Price=" + total_Price + "]";
	}

}
