package com.model;

public class appointmentinfo {
	private int akid;
	private String aautor;
	private String astartaddress;
	private String aendaddress;
	private String aphone;
	private String aprice;
	private String atitle;
	private String acontent;
	private String atime;
	private String apicture;
	public appointmentinfo() {
		super();
	}
	public appointmentinfo(int akid, String aautor, String astartaddress, String aendaddress, String aphone,
			String aprice, String atitle, String acontent, String atime, String apicture) {
		super();
		this.akid = akid;
		this.aautor = aautor;
		this.astartaddress = astartaddress;
		this.aendaddress = aendaddress;
		this.aphone = aphone;
		this.aprice = aprice;
		this.atitle = atitle;
		this.acontent = acontent;
		this.atime = atime;
		this.apicture = apicture;
	}
	/**
	 * @return the akid
	 */
	public int getAkid() {
		return akid;
	}
	/**
	 * @param akid the akid to set
	 */
	public void setAkid(int akid) {
		this.akid = akid;
	}
	/**
	 * @return the aautor
	 */
	public String getAautor() {
		return aautor;
	}
	/**
	 * @param aautor the aautor to set
	 */
	public void setAautor(String aautor) {
		this.aautor = aautor;
	}
	/**
	 * @return the astartaddress
	 */
	public String getAstartaddress() {
		return astartaddress;
	}
	/**
	 * @param astartaddress the astartaddress to set
	 */
	public void setAstartaddress(String astartaddress) {
		this.astartaddress = astartaddress;
	}
	/**
	 * @return the aendaddress
	 */
	public String getAendaddress() {
		return aendaddress;
	}
	/**
	 * @param aendaddress the aendaddress to set
	 */
	public void setAendaddress(String aendaddress) {
		this.aendaddress = aendaddress;
	}
	/**
	 * @return the aphone
	 */
	public String getAphone() {
		return aphone;
	}
	/**
	 * @param aphone the aphone to set
	 */
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	/**
	 * @return the aprice
	 */
	public String getAprice() {
		return aprice;
	}
	/**
	 * @param aprice the aprice to set
	 */
	public void setAprice(String aprice) {
		this.aprice = aprice;
	}
	/**
	 * @return the atitle
	 */
	public String getAtitle() {
		return atitle;
	}
	/**
	 * @param atitle the atitle to set
	 */
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	/**
	 * @return the acontent
	 */
	public String getAcontent() {
		return acontent;
	}
	/**
	 * @param acontent the acontent to set
	 */
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	/**
	 * @return the atime
	 */
	public String getAtime() {
		return atime;
	}
	/**
	 * @param atime the atime to set
	 */
	public void setAtime(String atime) {
		this.atime = atime;
	}
	/**
	 * @return the apicture
	 */
	public String getApicture() {
		return apicture;
	}
	/**
	 * @param apicture the apicture to set
	 */
	public void setApicture(String apicture) {
		this.apicture = apicture;
	}
	
	
}
