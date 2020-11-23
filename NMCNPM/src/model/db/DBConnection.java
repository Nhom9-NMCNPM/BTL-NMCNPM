package model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn= null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://ADMINISTRATOR\\SQLEXPRESS:1433;databaseName=dbCNPM;";
			conn = DriverManager.getConnection(url,"sa", "123456789");
			System.out.println("okay");
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
		}
		return conn;
	}
}