package model.businesslogic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import model.bean.CanBo;
import model.bean.SKTheoHo;
import model.bean.SoHoKhau;

public class PersonDAO {
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
	public static ArrayList<CanBo> getDSCB(Connection conn) {
		ArrayList<CanBo> listCB = new ArrayList<CanBo>();
		String sql = "Select NamePerson, Birthday, ChucVu, Phone, Email from CanBo, Person "
				+ "where CanBo.id_Person = Person.id_Person " + 
				"order by NamePerson;";
		try {
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			while(result.next()) {
				CanBo cb = new CanBo();
				cb.setTenCB(result.getString(1));
				cb.setBirthCB(result.getDate(2));
				cb.setChucVu(result.getString(3));
				cb.setPhone(result.getString(4));
				cb.setEmail(result.getString(5));
				listCB.add(cb);
			}
			result.close();
			sta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return listCB;
	}
	public static ArrayList<SKTheoHo> getSKTheoHo(Connection conn,String idSHK) {
		ArrayList<SKTheoHo> list = new ArrayList<SKTheoHo>();
		String sql = "select sk.NameSK,sk.ThoiGian,sk.NgayBD,tg.Status,tg.NguoiDaiDien from ThamGia tg, SuKien sk "
				+ "where sk.id_SK = tg.id_SK and tg.id_SHK = '"+idSHK+"'";
		try {
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			while(result.next()) {
				SKTheoHo sk = new SKTheoHo();
				sk.setNameSK(result.getString(1));
				sk.setTime(result.getTime(2));
				sk.setNgaySK(result.getDate(3));
				sk.setStatus(result.getBoolean(4));
				sk.setNguoiDaiDien(result.getString(5));
				list.add(sk);
			}
		} catch (Exception e) {
			
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error", JOptionPane.ERROR_MESSAGE);
		}
		return list;
	}
}