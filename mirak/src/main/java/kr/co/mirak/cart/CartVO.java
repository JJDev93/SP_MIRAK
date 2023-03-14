package kr.co.mirak.cart;

import java.util.Date;

public class CartVO {
	
	private int cart_code;
	private Date cart_start;
	private String cart_day;
	private int cart_cnt;
	private int totalPrice;
	private int cart_check;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private int pro_price;
	private String pro_desc;
	private String pro_image;
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public Date getCart_start() {
		return cart_start;
	}
	public void setCart_start(Date cart_start) {
		this.cart_start = cart_start;
	}
	public String getCart_day() {
		return cart_day;
	}
	public void setCart_day(String cart_day) {
		this.cart_day = cart_day;
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
	public int getCart_check() {
		return cart_check;
	}
	public void setCart_check(int cart_check) {
		this.cart_check = cart_check;
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
	
	@Override
	public String toString() {
		return "CartVO [cart_code=" + cart_code + ", cart_start=" + cart_start + ", cart_day=" + cart_day
				+ ", cart_cnt=" + cart_cnt + ", totalPrice=" + totalPrice + ", cart_check=" + cart_check + ", mem_id="
				+ mem_id + ", pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_price=" + pro_price
				+ ", pro_desc=" + pro_desc + ", pro_image=" + pro_image + "]";
	}
	
	
}