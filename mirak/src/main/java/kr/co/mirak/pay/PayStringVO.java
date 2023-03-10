package kr.co.mirak.pay;

public class PayStringVO {
	private String pay_code;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private String pro_price;
	private String cart_cnt;
	private String cart_totprice;
	private String mem_name;
	private String mem_phone;
	private String mem_gender;
	private String mem_age;
	private String mem_address;
	private String pay_req;
	private String cart_day;
	private String cart_start;
	private String pro_image;
	private String pay_date;
	private String pay_stat;
	private String mem_point;
	
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
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
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(String cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public String getCart_totprice() {
		return cart_totprice;
	}
	public void setCart_totprice(String cart_totprice) {
		this.cart_totprice = cart_totprice;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_age() {
		return mem_age;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getPay_req() {
		return pay_req;
	}
	public void setPay_req(String pay_req) {
		this.pay_req = pay_req;
	}
	public String getCart_day() {
		return cart_day;
	}
	public void setCart_day(String cart_day) {
		this.cart_day = cart_day;
	}
	public String getCart_start() {
		return cart_start;
	}
	public void setCart_start(String cart_start) {
		this.cart_start = cart_start;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_stat() {
		return pay_stat;
	}
	public void setPay_stat(String pay_stat) {
		this.pay_stat = pay_stat;
	}
	public String getMem_point() {
		return mem_point;
	}
	public void setMem_point(String mem_point) {
		this.mem_point = mem_point;
	}
	
	@Override
	public String toString() {
		return "PayStringVO [pay_code=" + pay_code + ", mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", cart_cnt=" + cart_cnt + ", cart_totprice=" + cart_totprice
				+ ", mem_name=" + mem_name + ", mem_phone=" + mem_phone + ", mem_gender=" + mem_gender + ", mem_age="
				+ mem_age + ", mem_address=" + mem_address + ", pay_req=" + pay_req + ", cart_day=" + cart_day
				+ ", cart_start=" + cart_start + ", pro_image=" + pro_image + ", pay_date=" + pay_date + ", pay_stat="
				+ pay_stat + ", mem_point=" + mem_point + "]";
	}
	
	
}
