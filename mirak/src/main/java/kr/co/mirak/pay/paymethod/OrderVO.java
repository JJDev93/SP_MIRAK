package kr.co.mirak.pay.paymethod;

public class OrderVO {
	private int order_id;
	private String mem_id;
	private String pro_code;
	private String pro_name;
	private int pro_price;
	private int cart_cnt;
	private int totalPrice;
	private String group_id;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", mem_id=" + mem_id + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_price=" + pro_price + ", cart_cnt=" + cart_cnt + ", totalPrice=" + totalPrice
				+ ", group_id=" + group_id + "]";
	}
	
	
	
}
