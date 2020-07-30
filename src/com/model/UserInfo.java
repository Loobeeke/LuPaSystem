package com.model;

public class UserInfo {
	private String uname;
	private String uage;
	private String usex;
	private String uphone;
	private String uaddress;
	private String uexplain;
	public UserInfo() {
		super();
	}
	public UserInfo(String uname, String uage, String usex, String uphone, String uaddress, String uexplain) {
		super();
		this.uname = uname;
		this.uage = uage;
		this.usex = usex;
		this.uphone = uphone;
		this.uaddress = uaddress;
		this.uexplain = uexplain;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUage() {
		return uage;
	}
	public void setUage(String uage) {
		this.uage = uage;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUexplain() {
		return uexplain;
	}
	public void setUexplain(String uexplain) {
		this.uexplain = uexplain;
	}
	
	

}
