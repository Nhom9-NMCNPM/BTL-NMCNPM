package model.businesslogic;

public class LoginDAO {
	public static SoHoKhau getSoHoKhau(Connection conn,String idSHK) {
		SoHoKhau shk = new SoHoKhau();
		try {
			String sql = "Select * from SoHoKhau where id_SHK = '"+idSHK+"'";
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			if(result.next()) {
				String ma = result.getString(1);
				String ch = result.getString(2);
				String dc = "Số nhà "+result.getString(3)+"-"+result.getString(4)+"-"+result.getString(5)
							+"-"+result.getString(6)+"-"+result.getString(7);
				shk.setIdSHK(ma);
				shk.setChuHo(ch);
				shk.setDiaChi(dc);
				return shk;
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return null;
	}
}
