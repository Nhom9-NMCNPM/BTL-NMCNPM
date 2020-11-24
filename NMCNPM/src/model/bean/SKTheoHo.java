package model.bean;

import java.util.Date;

public class SKTheoHo {
	private String tenSK;
	private Date ngay;
	private Date time;
	private boolean status;
	private String nguoiDaiDien;
	public String getTenSK() {
		return tenSK;
	}
	public void setTenSK(String tenSK) {
		this.tenSK = tenSK;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getNguoiDaiDien() {
		return nguoiDaiDien;
	}
	public void setNguoiDaiDien(String nguoiDaiDien) {
		this.nguoiDaiDien = nguoiDaiDien;
	}
}