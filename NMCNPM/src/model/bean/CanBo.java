package model.bean;

import java.util.Date;

public class CanBo {
//	private String maCB;
	private String tenCB;
	private Date birthCB;
	private String chucVu;
	private String phone;
	private String email;
	public CanBo(String maCB, String tenCB, Date birthCB, String chucVu, String phone, String email) {
		super();
		this.maCB = maCB;
		this.tenCB = tenCB;
		this.birthCB = birthCB;
		this.chucVu = chucVu;
		this.phone = phone;
		this.email = email;
	}
	public CanBo() {
		super();
	}

	public String getMaCB() {
		return maCB;
	}
	public void setMaCB(String maCB) {
		this.maCB = maCB;
	}
	public String getTenCB() {
		return tenCB;
	}
	public void setTenCB(String tenCB) {
		this.tenCB = tenCB;
	}
	public Date getBirthCB() {
		return birthCB;
	}
	public void setBirthCB(Date birthCB) {
		this.birthCB = birthCB;
	}
	public String getChucVu() {
		return chucVu;
	}
	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
