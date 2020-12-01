package view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class AdminPage extends JFrame {
	
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JPanel pnL=new JPanel();
	private JPanel pnR=new JPanel();
	private JButton btnQL = new JButton("Quản lý");
	private JButton btnHome = new JButton("Trang chủ");
	private JButton btnDX = new JButton("Đăng xuất");
	private JButton btnTK = new JButton("Thống kê");
	private String user;
	private int iSL = 1;
	private Connection conn;
	
	public AdminPage(Connection conn, String user) {
		super("NMCNPM");
		this.conn = conn;
		this.user = user;
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setMinimumSize(new Dimension(1200, 750));
		setLocationRelativeTo(null);
		setResizable(true);
		
		
		
		setVisible(true);
	}

}
