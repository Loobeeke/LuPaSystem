package com.model;

public class Hotel {
	private Integer hnumber;
	private String hname;
	private String hdetail;
	private String hprice;
	private String haddress;
	private String htype;
	private String hphone;
	private String hpicture;
	public Hotel() {
		super();
	}
	public Hotel(Integer hnumber, String hname, String hdetail, String hprice, String haddress, String htype,
			String hphone, String hpicture) {
		super();
		this.hnumber = hnumber;
		this.hname = hname;
		this.hdetail = hdetail;
		this.hprice = hprice;
		this.haddress = haddress;
		this.htype = htype;
		this.hphone = hphone;
		this.hpicture = hpicture;
	}
	public Integer getHnumber() {
		return hnumber;
	}
	public void setHnumber(Integer hnumber) {
		this.hnumber = hnumber;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHdetail() {
		return hdetail;
	}
	public void setHdetail(String hdetail) {
		this.hdetail = hdetail;
	}
	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getHpicture() {
		return hpicture;
	}
	public void setHpicture(String hpicture) {
		this.hpicture = hpicture;
	}

}
