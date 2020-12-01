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
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_1 = new JPanel();
		contentPane.add(panel_1, BorderLayout.SOUTH);
		panel_1.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		JLabel lblNewLabel_1 = new JLabel("Bài tập lớn nhập môn công nghệ phần mềm");
		lblNewLabel_1.setPreferredSize(new Dimension(280, 25));
		lblNewLabel_1.setFont(new Font("Tahoma", Font.ITALIC, 14));
		panel_1.add(lblNewLabel_1);
		
		JPanel panel = new JPanel();
		panel.setPreferredSize(new Dimension(10, 50));
		contentPane.add(panel, BorderLayout.NORTH);
		panel.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		JLabel lblNewLabel = new JLabel("Hệ thống quản lý dân cư Hà Nội");
		lblNewLabel.setForeground(Color.BLUE);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 25));
		panel.add(lblNewLabel);
		pnL.setPreferredSize(new Dimension(230, 10));
		
		JSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,pnL,pnR);
		pnR.setPreferredSize(new Dimension(700, 600));
		pnR.setLayout(new BorderLayout(0, 0));
		pnR.add(new InformationAdmin(conn, user));
		pnL.setLayout(null);
		
		JLabel lblNewLabel_2 = new JLabel("Chức năng");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblNewLabel_2.setBounds(70, 28, 91, 23);
		pnL.add(lblNewLabel_2);
		btnHome.setPreferredSize(new Dimension(133, 25));
		
		
		btnHome.setBounds(38, 96, 156, 25);
		pnL.add(btnHome);
		btnQL.setPreferredSize(new Dimension(133, 25));
		
		btnQL.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnQL.setBounds(38, 166, 156, 25);
		pnL.add(btnQL);
		btnDX.setPreferredSize(new Dimension(133, 25));
		
		btnDX.setBounds(38, 309, 156, 25);
		pnL.add(btnDX);
		
		btnTK.setPreferredSize(new Dimension(133, 25));
		btnTK.setBounds(38, 234, 156, 25);
		pnL.add(btnTK);
		splitPane.setOneTouchExpandable(true);
		
		btnHome.setFocusPainted(false);
		btnQL.setFocusPainted(false);
		btnTK.setFocusPainted(false);
		btnDX.setFocusPainted(false);
		
		contentPane.add(splitPane, BorderLayout.CENTER);
		addEvents();
		start();
		
		
		setVisible(true);
	}

}
