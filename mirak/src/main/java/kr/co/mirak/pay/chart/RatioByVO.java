package kr.co.mirak.pay.chart;

public class RatioByVO {
	private int mem_gender;
	private int mem_age;
	private int count;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ratioByVO [mem_gender=" + mem_gender + ", mem_age=" + mem_age + ", count=" + count + "]";
	}
}
