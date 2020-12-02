package model.businesslogic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

import model.bean.CanBo;
import model.bean.SoHoKhau;
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
	
	public boolean ktTonTai(Connection conn,String idSK) {
		String sql="Select id_SK from SuKien where id_SK='"+idSK+"'";
		Statement statement;
		try {
			statement= conn.createStatement();
			ResultSet rs= statement.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		return false;
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
	
	public static String getChuHo(Connection conn,String maSHK) {
		String name = null;
		String sql = "select TenChuHo from SoHoKhau where id_SHK = ?";
		try {
			PreparedStatement preSta = conn.prepareStatement(sql);
			preSta.setString(1, maSHK);
			ResultSet result = preSta.executeQuery();
			result.next();
			name = result.getString(1);
			result.close();
			preSta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error", JOptionPane.ERROR_MESSAGE);
		}
		return name;
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
	
	public ArrayList<String> getNhanKhau(Connection conn, String maSHK){
		ArrayList<String> listNK = new ArrayList<String>();
		String sql = "Select NamePerson from Person where id_SHK = '"+maSHK+"'";
		try {
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			while(result.next()) {
				listNK.add(result.getString(1));
			}
			listNK.add("");
			result.close();
			sta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return listNK;
	}

	public ArrayList<SuKien> getSKBangTK(Connection conn, String txt, int tool){
		ArrayList<SuKien> listSK = new ArrayList<SuKien>();
		String sql = "Select * from SuKien where ";
		switch (tool) {
		case 0:
			sql += "id_SK like '%"+txt+"%' ORDER BY NameSK";
			break;
		case 1:
			sql += "NameSK like N'%"+txt+"%' ORDER BY NameSK";
			break;
		case 2:
			sql += "NgayBD like '%"+txt+"%' ORDER BY NameSK";
		}
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
	
public void updateStatus(Connection conn, String idSK, String idSHK ,boolean value) {
		
		try {
			String sql = "Update ThamGia Set Status = '"+value+"' where id_SK = ? AND id_SHK = ?";
			PreparedStatement preSta = conn.prepareStatement(sql);
			preSta.setString(1, idSK);
			preSta.setString(2, idSHK);
			int z = preSta.executeUpdate();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	public void updateDaiDien(Connection conn, String idSK, String idSHK ,String value) {
		String sql = "Update ThamGia Set [NguoiDaiDien] = N'"+value+"' where (id_SK = '"+idSK+"' and id_SHK = '"+idSHK+"')";
		try {
			Statement sta = conn.createStatement();
			int x = sta.executeUpdate(sql);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
	}

	public void upDateAll(Connection conn,String maSK, boolean value) {
		String sql = "Update ThamGia Set Status = '"+value+"' where id_SK = '"+maSK+"'";
		try {
			Statement sta = conn.createStatement();
			int x = sta.executeUpdate(sql);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	public static CanBo getCanBo(Connection conn,String idCB) {
		try {
			String sql = "select cb.id_CB,p.NamePerson,p.BirthDay,cb.ChucVu,cb.Phone,cb.Email from CanBo cb,Person p "
					+ "where (cb.id_Person = p.id_Person and cb.id_CB = '"+idCB+"')";
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			if(result.next()) {
				CanBo cb = new CanBo();
				cb.setMaCB(result.getString(1));
				cb.setTenCB(result.getString(2));
				cb.setBirthCB(result.getDate(3));
				cb.setChucVu(result.getString(4));
				cb.setPhone(result.getString(5));
				cb.setEmail(result.getString(6));
				return cb;
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return null;
	}
	
	public boolean xuLyNgay(int day,int month, int year) {
		switch(month){
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return day<=31;
		case 4:
		case 6:
		case 9:
		case 11:
			return day<=30;
		case 2:
			if( year%4 == 0 && year%100 != 0 || year%400 == 0) {
				return day<=29;
			}
			else {
				return day<=28;
			}
		}
		return false;
	}
	
	public ArrayList<SoHoKhau> getGmail(Connection conn){
		ArrayList<SoHoKhau> listG = new ArrayList<SoHoKhau>();
		String sql = "Select TenChuHo,Email from SoHoKhau where Email is NOT null";
		try {
			Statement sta = conn.createStatement();
			ResultSet result = sta.executeQuery(sql);
			while(result.next()) {
				SoHoKhau shk = new SoHoKhau();
				shk.setChuHo(result.getString(1));
				shk.seteMail(result.getString(2));
				listG.add(shk);
			}
			result.close();
			sta.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
		}
		return listG;
	}
	
	public boolean sendTB(Connection conn,String ngayBD,String time,String tenSK) {
		ArrayList<SoHoKhau> listG = getGmail(conn);
		boolean check = true;
		for(SoHoKhau shk: listG) {
			check = sendMail(shk.geteMail(), shk.getChuHo(), ngayBD, tenSK, time);
			if(check == false) {
				break;
			}
		}
		return check;
	}
	
	public boolean sendMail(String address,String chuHo, String ngayBD, String tenSK,String time) {
		String title = "Họp dân phố ngày " +ngayBD;
		String noiDung = "Xin chào hộ gia đình: " + chuHo+"\n"
							+"Bạn có cuộc họp dân phố vào hồi: "+time+" ngày: "+ngayBD+".\n"
							+"Tại nhà văn hóa phường Đống Đa\n"
							+"Nội dung: "+tenSK+".\n"
							+"Rất mong có sự tham gia của người đại diện cho gia đình";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.port", 465);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port", 587);
		// get Session
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			// @Override

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("angelababy0379032830@gmail.com", "chau737701");
			}
		});

		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("angelababy0379032830@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
			message.setSubject(title);
			message.setText(noiDung);
			Transport.send(message);
		} catch (AddressException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
			return false;
		} catch (MessagingException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
			return false;
		}
		return true;	
	}
	
	public boolean checkDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date ngayBD = sdf.parse(date);
			Calendar cal = Calendar.getInstance();
			Date current = cal.getTime();
			int yc = current.getYear();
			int mc = current.getMonth();
			int dc = current.getDay();
			int yBD = ngayBD.getYear();
			int mBD = ngayBD.getMonth();
			int dBD = ngayBD.getDay();
			if(yc > yBD)
				return false;
			else if(yc == yBD){
				if( mc > mBD)
					return false;
				else if(mc == mBD){
					if(dc >= dBD)
						return false;
					else
						return true;
				}
				else {
					return true;
				}
			}
			else {
				return true;
			}
		} catch (ParseException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
		}
		return false;
	}
}
