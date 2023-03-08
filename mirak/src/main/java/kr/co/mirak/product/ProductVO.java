package kr.co.mirak.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {

	private String pro_code, pro_name, pro_desc, pro_image;
	private int pro_price;

	private MultipartFile uploadFile;
	
	private int pro_cnt;

	public String getPro_code() {
		return pro_code;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getPro_cnt() {
		return pro_cnt;
	}

	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
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

	public String getPro_image() {
		return pro_image;
	}

	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	@Override
	public String toString() {
		return "ProductVO [pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_desc=" + pro_desc + ", pro_image="
				+ pro_image + ", pro_price=" + pro_price + ", uploadFile=" + uploadFile + "]";
	}

	

}
