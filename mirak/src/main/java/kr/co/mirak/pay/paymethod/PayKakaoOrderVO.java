package kr.co.mirak.pay.paymethod;

import java.sql.Date;

public class PayKakaoOrderVO {

	private String pro_code;
	private String cart_code;
	private String cart_cnt;
	private String pro_price;
	private String pro_name;
	private String totalPrice;
	private String pro_desc;
	private String pro_image;
	private String pay_req;
	private String cart_day;
	private String cart_start;
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getCart_code() {
		return cart_code;
	}
	public void setCart_code(String cart_code) {
		this.cart_code = cart_code;
	}
	public String getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(String cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
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
	@Override
	public String toString() {
		return "PayKakaoOrderVO [pro_code=" + pro_code + ", cart_code=" + cart_code + ", cart_cnt=" + cart_cnt
				+ ", pro_price=" + pro_price + ", pro_name=" + pro_name + ", totalPrice=" + totalPrice + ", pro_desc="
				+ pro_desc + ", pro_image=" + pro_image + ", pay_req=" + pay_req + ", cart_day=" + cart_day
				+ ", cart_start=" + cart_start + "]";
	}
	
	
	
}
