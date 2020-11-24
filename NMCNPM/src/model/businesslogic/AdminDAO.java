package model.businesslogic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import javax.swing.JOptionPane;

import model.bean.SuKien;

public class AdminDAO {
	
	public ArrayList<SuKien> getSuKien(Connection conn){
		ArrayList<SuKien> listSK = new ArrayList<SuKien>();
		String sql = "Select * from SuKien ORDER BY NameSK";
		try {
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			while(result.next()) {
				SuKien sk = new SuKien();
				sk.setIdSK(result.getString(1));
				sk.setNameSK(result.getString(2));
				sk.setTime(result.getTime(3));
				sk.setNgaySK(result.getDate(4));
				listSK.add(sk);
			}
			result.close();
			sta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return listSK;
	}
}
