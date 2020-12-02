package view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import model.businesslogic.AdminDAO;
import view.ChangeSK.PressKey;

public class ChangeSK extends JDialog {
	private static final long serialVersionUID = 1L;
	private JTextField txtNameSK;
	private AdminDAO adminDao = new AdminDAO();
	private Connection conn = null;
	private String maSK;
	private JComboBox<Integer> cbDay = new JComboBox<Integer>();
	private JComboBox<Integer> cbMonth = new JComboBox<Integer>();
	private JComboBox<Integer> cbYear = new JComboBox<Integer>();
	private JComboBox<Integer> cbGio = new JComboBox<Integer>();
	private JComboBox<Integer> cbPhut = new JComboBox<Integer>();
	private JButton btnExit = new JButton("Thoát");
	private JButton btnU = new JButton("Cập nhật");
	private PressKey press;
	
	public ChangeSK(Connection conn,String maSK,String tenSK,String ngaySK,String timeSK) {
		this.conn = conn;
		this.maSK = maSK;
		setTitle("Chỉnh sửa sự kiện");
		setSize(600, 500);
		setResizable(false);
		setModal(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		getContentPane().setLayout(null);
	}
	
	public class PressKey implements KeyListener{

		public void keyTyped(KeyEvent e) {
		
		}

		public void keyPressed(KeyEvent e) {
			if(e.getKeyCode() == KeyEvent.VK_ENTER) {
				btnU.doClick();
			}
		}

		public void keyReleased(KeyEvent e) {
			
		}	
	}
}
