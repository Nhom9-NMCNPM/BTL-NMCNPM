package model.businesslogic;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

import model.bean.Login;

public class LoginDAO {
	public Login ktTonTai(Connection conn,String user, String pass) {
		String sql="Select * from Login where (UserName=? and PassWord=?)";
		PreparedStatement pst;
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, user);
			pst.setString(2, pass);
			ResultSet rs= pst.executeQuery();
			if (rs.next()) {
				Login login= new Login();
				login.setUser(user);
				return login;
			}
			rs.close();
			pst.close();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		return null;
	}
	public boolean chuyenTrang(String user) {
		if((user.equalsIgnoreCase("cbToTruong")) || (user.equalsIgnoreCase("cbToPho")) || (user.equalsIgnoreCase("cbHanhChinh"))) {
			return true;
		}
		return false;
	}
}
