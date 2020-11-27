package model.businesslogic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import javax.swing.JOptionPane;

import model.bean.SuKien;
import model.bean.ThamGia;

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
	public ArrayList<ThamGia> getThamGiaTheoSuKien(Connection conn, String maSK){
		ArrayList<ThamGia> listThamGia = new ArrayList<ThamGia>();
		String sql = "select tg.id_SHK, shk.TenChuHo,tg.Status,tg.NguoiDaiDien from ThamGia tg,SoHoKhau shk "
						+"where tg.id_SHK = shk.id_SHK and tg.id_SK = ? "
						+"order by shk.TenChuHo";
				
		try {
			PreparedStatement preSta = conn.prepareStatement(sql);
			preSta.setString(1, maSK);
			ResultSet result = preSta.executeQuery();
			while(result.next()) {
				ThamGia tg = new ThamGia();
				String shk = result.getString(1);
				String ch = result.getString(2);
				boolean tt = result.getBoolean(3);
				String ng = result.getString(4);
				tg.setIdSK(maSK);
				tg.setIdSHK(shk);
				tg.setChuHo(ch);
				tg.setStatus(tt);
				tg.setDaiDien(ng);
				listThamGia.add(tg);
			}
			result.close();
			preSta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error", JOptionPane.ERROR_MESSAGE);
		}
		return listThamGia;
	}
	
	public ArrayList<String> getListSHK(Connection conn){
		ArrayList<String> listSHK= new ArrayList<String>();
		String sql="Select id_SHK from SoHoKhau";
		Statement statement;
		try {
			statement= conn.createStatement();
			ResultSet rs= statement.executeQuery(sql);
			while( rs.next()) {
				listSHK.add(rs.getString(1));
			}
			rs.close();
			statement.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		
		return listSHK;
	}
	
	public void xoaSuKien(Connection conn, String maSK) {
		String sql1 = "Delete from ThamGia where id_SK=?";
		String sql2 = "Delete from SuKien where id_SK=?";
		try {
			PreparedStatement preSta = conn.prepareStatement(sql1);
			preSta.setString (1, maSK);
			preSta.executeUpdate();
			preSta = conn.prepareStatement(sql2);
			preSta.setString (1, maSK);
			preSta.executeUpdate();
			preSta.close();
		} catch (Exception e){
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}

	}
	public void getTaoSuKien(Connection conn, String idSK, String nameSK, String ngaySK, String time) {
		String sql=" Insert into SuKien values (?, ?, ?, ?)";

		PreparedStatement preSta;
		try {
			preSta = conn.prepareStatement(sql);
			preSta.setString(1, idSK);
			preSta.setString(2, nameSK);
			preSta.setString(3, time);
			preSta.setString(4, ngaySK);
			int x= preSta.executeUpdate();
			if (x!=0) {
				int j;
				ArrayList<String> listSHK= getListSHK(conn);
				for (String i: listSHK) {
					String sql1="Insert into ThamGia([id_SK],[id_SHK]) values(?, ?)";
					preSta = conn.prepareStatement(sql1);
					preSta.setString(1, idSK);
					preSta.setString(2, i);
					j= preSta.executeUpdate();
				}
			}
			preSta.close();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,e.getMessage());
		}
	}
}