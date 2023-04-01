package kr.co.mirak.pay.chart;

public class TotalUsersVO {
	private int totalUsers;
	private String regdate, gender;
	public int getTotalUsers() {
		return totalUsers;
	}
	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "TotalUsersVO [totalUsers=" + totalUsers + ", regdate=" + regdate + ", gender=" + gender + "]";
	}
	
}
