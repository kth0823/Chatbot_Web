package com.example.demo.vo;
import java.util.Date;

public class UserVO {
	private String User_Id;
	private String User_passwd;
	private String User_phone;
	private Date regDate;
	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String User_Id) {
		this.User_Id = User_Id;
	}
	public String getUser_passwd() {
		return User_passwd;
	}
	public void setUser_passwd(String User_passwd) {
		this.User_passwd = User_passwd;
	}
	public String getUser_phone() {
		return User_phone;
	}
	public void setUser_phone(String User_phone) {
		this.User_phone = User_phone;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + User_Id + ", userPass=" + User_passwd + ", userName=" + User_phone + ", regDate="
				+ regDate + "]";
	}
}
