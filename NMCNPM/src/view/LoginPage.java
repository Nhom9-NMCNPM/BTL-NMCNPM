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
