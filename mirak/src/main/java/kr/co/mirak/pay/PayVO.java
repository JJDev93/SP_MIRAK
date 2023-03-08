package kr.co.mirak.pay;

import java.sql.Date;

public class PayVO {
	
	private int pay_code;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private int pro_price;
	private int cart_cnt;
	private int cart_totprice;
	private String mem_name;
	private String mem_phone;
	private int mem_gender;
	private int mem_age;
	private String mem_address;
	private String pay_req;
	private String cart_day;
	private Date cart_start;
	private String pro_image;
	private Date pay_date;
	private String pay_stat;
	private int mem_point;
	
	public int getPay_code() {
		return pay_code;
	}
	public void setPay_code(int pay_code) {
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
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public int getCart_totprice() {
		return cart_totprice;
	}
	public void setCart_totprice(int cart_totprice) {
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
	public int getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
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
	public Date getCart_start() {
		return cart_start;
	}
	public void setCart_start(Date cart_start) {
		this.cart_start = cart_start;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_stat() {
		return pay_stat;
	}
	public void setPay_stat(String pay_stat) {
		this.pay_stat = pay_stat;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	@Override
	public String toString() {
		return "PayVO [pay_code=" + pay_code + ", mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", cart_cnt=" + cart_cnt + ", cart_totprice=" + cart_totprice
				+ ", mem_name=" + mem_name + ", mem_phone=" + mem_phone + ", mem_gender=" + mem_gender + ", mem_age="
				+ mem_age + ", mem_address=" + mem_address + ", pay_req=" + pay_req + ", cart_day=" + cart_day
				+ ", cart_start=" + cart_start + ", pro_image=" + pro_image + ", pay_date=" + pay_date + ", pay_stat="
				+ pay_stat + ", mem_point=" + mem_point + "]";
	}
	

}
