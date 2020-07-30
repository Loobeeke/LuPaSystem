package com.model;

public class Dynamic {
	private Integer dnumber;
	private String dautor;
	private String dtitle;
	private String dcontent;
	private String ddate;
	private String dtime;
	private String dpicture;
	public Dynamic() {
		super();
	}
	public Dynamic(Integer dnumber, String dautor, String dtitle, String dcontent, String ddate, String dtime,
			String dpicture) {
		super();
		this.dnumber = dnumber;
		this.dautor = dautor;
		this.dtitle = dtitle;
		this.dcontent = dcontent;
		this.ddate = ddate;
		this.dtime = dtime;
		this.dpicture = dpicture;
	}
	public Integer getDnumber() {
		return dnumber;
	}
	public void setDnumber(Integer dnumber) {
		this.dnumber = dnumber;
	}
	public String getDautor() {
		return dautor;
	}
	public void setDautor(String dautor) {
		this.dautor = dautor;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	public String getDpicture() {
		return dpicture;
	}
	public void setDpicture(String dpicture) {
		this.dpicture = dpicture;
	}
	

}
