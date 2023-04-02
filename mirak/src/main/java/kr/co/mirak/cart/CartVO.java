package kr.co.mirak.cart;

import java.sql.Date;

public class CartVO {
	
	private int cart_code;
	private String cart_day;
	private Date cart_start;
	private int cart_cnt;
	private int cart_totprice;
	private int cart_show;
	private int cart_check;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private int pro_price;
	private String pro_desc;
	private String pro_image;
	private int mem_code;
	private String mem_isapi;
	
	
	public String getMem_isapi() {
		return mem_isapi;
	}
	public void setMem_isapi(String mem_isapi) {
		this.mem_isapi = mem_isapi;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
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
	public int getCart_show() {
		return cart_show;
	}
	public void setCart_show(int cart_show) {
		this.cart_show = cart_show;
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
		return "CartVO [cart_code=" + cart_code + ", cart_day=" + cart_day + ", cart_start=" + cart_start
				+ ", cart_cnt=" + cart_cnt + ", cart_totprice=" + cart_totprice + ", cart_show=" + cart_show
				+ ", cart_check=" + cart_check + ", mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", pro_desc=" + pro_desc + ", pro_image=" + pro_image
				+ ", mem_code=" + mem_code + ", mem_isapi=" + mem_isapi + "]";
	}
	
}