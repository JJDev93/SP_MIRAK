package kr.co.mirak.pay.paymethod;

import java.sql.Date;

public class PayKakaoVO {
	private String mem_id;
	private String pro_code;//
	private String pro_name;//
	private int pro_price;//
	private String pro_desc;//
	private String pro_image;//
	private int cart_cnt;//
	private int totalPrice;//
	private String group_id;
	private String cart_day;//
	private Date cart_start;//
	private String pay_req;//
	private String tid;
	private String pay_type;
	private int cart_code;//
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
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
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
	public String getPay_req() {
		return pay_req;
	}
	public void setPay_req(String pay_req) {
		this.pay_req = pay_req;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	@Override
	public String toString() {
		return "PayKakaoVO [mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_price="
				+ pro_price + ", pro_desc=" + pro_desc + ", pro_image=" + pro_image + ", cart_cnt=" + cart_cnt
				+ ", totalPrice=" + totalPrice + ", group_id=" + group_id + ", cart_day=" + cart_day + ", cart_start="
				+ cart_start + ", pay_req=" + pay_req + ", tid=" + tid + ", pay_type=" + pay_type + ", cart_code="
				+ cart_code + "]";
	}
	
	
	
}
