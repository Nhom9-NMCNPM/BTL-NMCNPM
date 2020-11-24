package model.bean;

public class SoHoKhau {
	private String idSHK;
	private String chuHo;
	private String diaChi;
	private String eMail;
	public SoHoKhau(String idSHK, String chuHo, String diaChi, String eMail) {
		super();
		this.idSHK = idSHK;
		this.chuHo = chuHo;
		this.diaChi = diaChi;
		this.eMail = eMail;
	}
	public SoHoKhau() {
		super();
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
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	
}

