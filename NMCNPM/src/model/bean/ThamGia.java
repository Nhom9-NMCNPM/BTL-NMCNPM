package model.bean;

public class ThamGia {
	private String idSK;
	private String idSHK;
	private String chuHo;
	private boolean status;
	private String daiDien;
	
	public ThamGia(String idSK, String idSHK, String chuHo, boolean status, String daiDien) {
		super();
		this.idSK = idSK;
		this.idSHK = idSHK;
		this.chuHo = chuHo;
		this.status = status;
		this.daiDien = daiDien;
	}
	
	public boolean getStatus() {
		return status;
	}
	
	public void setStatus(boolean status) {
		this.status = status;
	}
	public ThamGia() {
		super();
	}
	public String getIdSK() {
		return idSK;
	}
	public void setIdSK(String idSK) {
		this.idSK = idSK;
	}
	public String getIdSHK() {
		return idSHK;
	}
	public void setIdSHK(String idSHK) {
		this.idSHK = idSHK;
	}
	public String getChuHo() {
		return chuHo;
	}
	public void setChuHo(String chuHo) {
		this.chuHo = chuHo;
	}
	
	public String getDaiDien() {
		return daiDien;
	}
	public void setDaiDien(String daiDien) {
		this.daiDien = daiDien;
	}
}
