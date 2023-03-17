package kr.co.mirak.pay;

import java.sql.Date;

public class PayVO {

	private int pay_code;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private int pro_price;
	private String pro_desc;
	private String pro_image;
	private int cart_cnt;
	private int totalPrice;
	private String mem_name;
	private String mem_phone;
	private int mem_gender;
	private int mem_age;
	private String mem_add1;
	private String mem_add2;
	private String mem_zipcode;
	private String pay_req;
	private String cart_day;
	private Date cart_start;
	private Date pay_date;
	private String status;
	private String group_id;

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

	public String getPro_desc() {
		return pro_desc;
	}

	public void setPro_desc(String pro_desc) {
		this.pro_desc = pro_desc;
	}

	public String getPro_image() {
		return pro_image;
	}

	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}

	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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

	public String getMem_add1() {
		return mem_add1;
	}

	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}

	public String getMem_add2() {
		return mem_add2;
	}

	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
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

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	@Override
	public String toString() {
		return "PayVO [pay_code=" + pay_code + ", mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", pro_desc=" + pro_desc + ", pro_image=" + pro_image
				+ ", cart_cnt=" + cart_cnt + ", totalPrice=" + totalPrice + ", mem_name=" + mem_name + ", mem_phone="
				+ mem_phone + ", mem_gender=" + mem_gender + ", mem_age=" + mem_age + ", mem_add1=" + mem_add1
				+ ", mem_add2=" + mem_add2 + ", mem_zipcode=" + mem_zipcode + ", pay_req=" + pay_req + ", cart_day="
				+ cart_day + ", cart_start=" + cart_start + ", pay_date=" + pay_date + ", status=" + status
				+ ", group_id=" + group_id + "]";
	}

}
