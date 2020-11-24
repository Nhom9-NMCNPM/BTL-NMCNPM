package model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn= null;
		try {
			String url = "jdbc:sqlserver://DESKTOP-77O14EV\\SQLEXPRESS:1433;databaseName=dbCNPM;";
			// Đổi 'DESKTOP-77O14EV' thành tên máy local 
			conn = DriverManager.getConnection(url,"sa", "12345678"); // đổi mk 
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
		}
		return conn;
	}
}