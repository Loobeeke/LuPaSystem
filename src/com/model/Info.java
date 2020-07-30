package com.model;

import java.sql.Date;

public class Info {

	private Integer tnumber ;
	private String tauthor ;
	private String theading ;
	private String tcontent ;
	private String tdate ;
    private String ttime ;
    private String tpicture ;
    public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	
	public Integer getTnumber() {
		return tnumber;
	}
	public void setTnumber(Integer tnumber) {
		this.tnumber = tnumber;
	}
	public String getTauthor() {
		return tauthor;
	}
	public void setTauthor(String tauthor) {
		this.tauthor = tauthor;
	}
	public String getTheading() {
		return theading;
	}
	public void setTheading(String theading) {
		this.theading = theading;
	}
	
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public String getTtime() {
		return ttime;
	}
	public void setTtime(String ttime) {
		this.ttime = ttime;
	}
	public String getTpicture() {
		return tpicture;
	}
	public void setTpicture(String tpicture) {
		this.tpicture = tpicture;
	}
    
    
    
	
}
