package com.model;

public class Manager {
	private Integer mid;
	private String mname;
	private String mpassword;
	private String mpicture;
	
	public Manager() {
		super();
	}
	
	public Manager(Integer mid, String mname, String mpassword, String mpicture) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mpassword = mpassword;
		this.mpicture = mpicture;
	}

	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMpicture() {
		return mpicture;
	}
	public void setMpicture(String mpicture) {
		this.mpicture = mpicture;
	}
	

}
