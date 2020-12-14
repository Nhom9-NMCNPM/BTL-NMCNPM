package model.bean;

public class SKTheoHo extends SuKien{
	
	private boolean status;
	private String nguoiDaiDien;

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

	public SKTheoHo() {
		super();
	}
}