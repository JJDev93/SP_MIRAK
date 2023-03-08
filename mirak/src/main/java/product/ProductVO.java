package kr.co.mirak.product;

public class ProductVO {
	
	private String pro_code,pro_name,pro_desc;
	private int pro_price,pro_cnt;
	
	private String opt_name;
	private int opt_price;
	
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_desc() {
		return pro_desc;
	}
	public void setPro_desc(String pro_desc) {
		this.pro_desc = pro_desc;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_cnt() {
		return pro_cnt;
	}
	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	
	public int getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(int opt_price) {
		this.opt_price = opt_price;
	}
	@Override
	public String toString() {
		return "ProductVO [pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_desc=" + pro_desc + ", pro_price="
				+ pro_price + ", pro_cnt=" + pro_cnt + ", opt_name=" + opt_name + ", opt_price=" + opt_price + "]";
	}

	

}
