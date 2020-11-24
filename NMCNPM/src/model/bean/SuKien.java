package model.bean;

import java.util.Date;

public class SuKien {
	private String idSK;
	private String nameSK;
	private Date time;
	private Date ngaySK;
	public SuKien() {
		super();
	}
	public SuKien(String idSK, String nameSK, Date time, Date ngaySK) {
		super();
		this.idSK = idSK;
		this.nameSK = nameSK;
		this.time = time;
		this.ngaySK = ngaySK;
	}
	public String getIdSK() {
		return idSK;
	}
	public void setIdSK(String idSK) {
		this.idSK = idSK;
	}
	public String getNameSK() {
		return nameSK;
	}
	public void setNameSK(String nameSK) {
		this.nameSK = nameSK;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Date getNgaySK() {
		return ngaySK;
	}
	public void setNgaySK(Date ngaySK) {
		this.ngaySK = ngaySK;
	}
	
}
