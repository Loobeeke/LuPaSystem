package com.model;

public class Food {
	public int fnumber;//��ʳid
	public String fname;//��ʳ����
	public String fstore;//��ʳ����
	public String ftype;//��ʳ����
	public String faddress;//��ʳ��ַ
	public String fprice;//��ʳ�۸�
	public String fphone;//��ʳ�绰
	public String fintroduce;//��ʳ����
	public String fpicture;//��ʳͼƬ
	
	
	public int getFnumber() {
		return fnumber;
	}

	public void setFnumber(int fnumber) {
		this.fnumber = fnumber;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFstore() {
		return fstore;
	}

	public void setFstore(String fstore) {
		this.fstore = fstore;
	}

	public String getFtype() {
		return ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public String getFaddress() {
		return faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	public String getFprice() {
		return fprice;
	}

	public void setFprice(String fprice) {
		this.fprice = fprice;
	}

	public String getFphone() {
		return fphone;
	}

	public void setFphone(String fphone) {
		this.fphone = fphone;
	}

	public String getFintroduce() {
		return fintroduce;
	}

	public void setFintroduce(String fintroduce) {
		this.fintroduce = fintroduce;
	}

	public String getFpicture() {
		return fpicture;
	}

	public void setFpicture(String fpicture) {
		this.fpicture = fpicture;
	}
	

	public Food(int fnumber, String fname, String fstore, String ftype, String faddress, String fprice, String fphone,
			String fintroduce, String fpicture) {
		super();
		this.fnumber = fnumber;
		this.fname = fname;
		this.fstore = fstore;
		this.ftype = ftype;
		this.faddress = faddress;
		this.fprice = fprice;
		this.fphone = fphone;
		this.fintroduce = fintroduce;
		this.fpicture = fpicture;
	}

	public Food(){
		super();
	}


	/*@Override
	public String toString() {
		return "Food [fnumber=" + fnumber + ", fname=" + fname + ", fstore=" + fstore + ", ftype=" + ftype
				+ ", faddress=" + faddress + ", fprice=" + fprice + ", fphone=" + fphone + ", fintroduce=" + fintroduce
				+ ", fpicture=" + fpicture + "]";
	}	*/

}
