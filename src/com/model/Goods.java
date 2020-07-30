package com.model;

public class Goods {
	private Integer gnumber;
	private String gname;
	private String gstore;
	private String gtype;
	private String gaddress;
	private String gprice;
	private String gphone;
	private String gintroduce;
	private String gpicture;
	public Goods() {
		super();
	}
	public Goods(Integer gnumber, String gname, String gstore, String gtype, String gaddress, String gprice,
			String gphone, String gintroduce, String gpicture) {
		super();
		this.gnumber = gnumber;
		this.gname = gname;
		this.gstore = gstore;
		this.gtype = gtype;
		this.gaddress = gaddress;
		this.gprice = gprice;
		this.gphone = gphone;
		this.gintroduce = gintroduce;
		this.gpicture = gpicture;
	}
	public Integer getGnumber() {
		return gnumber;
	}
	public void setGnumber(Integer gnumber) {
		this.gnumber = gnumber;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGstore() {
		return gstore;
	}
	public void setGstore(String gstore) {
		this.gstore = gstore;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public String getGaddress() {
		return gaddress;
	}
	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
	}
	public String getGprice() {
		return gprice;
	}
	public void setGprice(String gprice) {
		this.gprice = gprice;
	}
	public String getGphone() {
		return gphone;
	}
	public void setGphone(String gphone) {
		this.gphone = gphone;
	}
	public String getGintroduce() {
		return gintroduce;
	}
	public void setGintroduce(String gintroduce) {
		this.gintroduce = gintroduce;
	}
	public String getGpicture() {
		return gpicture;
	}
	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}
	

}
