package model.bean;

public class ThongKe extends SoHoKhau {

	private int solan;
	
	public ThongKe(String idSHK, String chuHo, String diaChi, String eMail, int solan) {
		super(idSHK, chuHo, diaChi, eMail);
		this.solan = solan;
	}

	public ThongKe() {
		super();
	}

	public int getSolan() {
		return solan;
	}

	public void setSolan(int solan) {
		this.solan = solan;
	}
}
