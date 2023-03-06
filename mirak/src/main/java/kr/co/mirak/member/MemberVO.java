package kr.co.mirak.member;

import java.util.Date;

public class MemberVO {
	private String mem_id, mem_PW, mem_name, mem_phone, mem_token;
	private int mem_age, mem_gender, mem_point;
	private Date mem_regdate;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_PW() {
		return mem_PW;
	}
	public void setMem_PW(String mem_PW) {
		this.mem_PW = mem_PW;
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
	public String getMem_token() {
		return mem_token;
	}
	public void setMem_token(String mem_token) {
		this.mem_token = mem_token;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}
	public int getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_PW=" + mem_PW + ", mem_name=" + mem_name + ", mem_phone="
				+ mem_phone + ", mem_token=" + mem_token + ", mem_age=" + mem_age + ", mem_gender=" + mem_gender
				+ ", mem_point=" + mem_point + ", mem_regdate=" + mem_regdate + "]";
	}
	

}
