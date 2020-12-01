package view;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import model.bean.Login;
import model.businesslogic.LoginDAO;
import model.db.DBConnection;

import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.awt.Color;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;
import java.awt.event.ActionEvent;

public class LoginPage extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField txtUser;
	private JPasswordField txtPass;
	private Connection conn= DBConnection.getConnection();
	private JButton btnLogin = new JButton("Đăng nhập");
	private LoginDAO lgD = new LoginDAO();
	PressKey press;
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					new LoginPage();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public LoginPage() {
		super("NMCNPM2");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(600, 370);
		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);
		press = new PressKey();
		addControls();
		addEvents();
	}
	
	private void addEvents() {
		btnLogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String user= txtUser.getText();
				@SuppressWarnings("deprecation")
				String pass= txtPass.getText();
				Login lg= lgD.ktTonTai(conn, user, pass);
				if (lg == null) {
					JOptionPane.showMessageDialog(null, "Tài khoản hoặc mật khẩu không chính xác!");
				} else {
					xulyLogin(lg.getUser());
				}
			}
		});
	}

	protected void xulyLogin(String user) {
		int gt = lgD.chuyenTrang(user);
		if ( gt == 1) {
			new AdminPage(conn, user);
			dispose();
		}
		else if( gt == 0){
			new PersonPage(conn,user);
			dispose();
		}
		else {
			JOptionPane.showMessageDialog(null, "Bạn không thực hiện được chức năng này", "Warring", JOptionPane.WARNING_MESSAGE);
		}
	}

	private void addControls() {
		contentPane = new JPanel();
		contentPane.setForeground(Color.BLUE);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Hệ thống quản lý dân cư Hà Nội");
		lblNewLabel.setBounds(131, 23, 320, 25);
		lblNewLabel.setForeground(Color.BLUE);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		contentPane.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Vui lòng đăng nhập để sử dụng hệ thống");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.ITALIC, 16));
		lblNewLabel_1.setBounds(147, 72, 297, 31);
		contentPane.add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("Tài khoản:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 15));
		lblNewLabel_2.setBounds(111, 147, 77, 16);
		contentPane.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("Mật khẩu:");
		lblNewLabel_3.setToolTipText("20");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 15));
		lblNewLabel_3.setBounds(111, 213, 77, 16);
		contentPane.add(lblNewLabel_3);
		
		txtUser = new JTextField();
		txtUser.addKeyListener(press);
		txtUser.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtUser.setBounds(216, 140, 205, 31);
		contentPane.add(txtUser);
		txtUser.setColumns(10);
		
		txtPass = new JPasswordField();
		txtPass.addKeyListener(press);
		txtPass.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtPass.setBounds(216, 206, 205, 31);
		contentPane.add(txtPass);

		btnLogin.setBounds(310, 268, 111, 25);
		contentPane.add(btnLogin);
	}

	private class PressKey implements KeyListener{

		public void keyTyped(KeyEvent e) {
		
		}

		public void keyPressed(KeyEvent e) {
			if(e.getKeyCode() == KeyEvent.VK_ENTER) {
				btnLogin.doClick();
			}
		}

		public void keyReleased(KeyEvent e) {
			
		}	
	}
}
