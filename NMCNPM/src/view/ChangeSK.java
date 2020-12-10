package view;


import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
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
	
	private void addEvents() {
		btnU.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				xuLyChange();
			}
		});
		btnExit.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
	}
	
	protected void xuLyChange() {
		if (txtNameSK.getText().length() == 0) {
			JOptionPane.showMessageDialog(null, "Nhập thiếu dữ liệu!");
			return;
		}
		else{
			int day= (int) cbDay.getSelectedItem();
			int month= (int) cbMonth.getSelectedItem();
			int year= (int) cbYear.getSelectedItem();
			String ngaySK= year+"-"+ month+"-"+day;
			boolean check= adminDao.xuLyNgay(day, month, year);
			int gio = (int) cbGio.getSelectedItem();
			int phut = (int) cbPhut.getSelectedItem();
			String time = gio+":"+phut+":"+"00";
			if (check== true) {
				adminDao.ChangeSK(conn, maSK, txtNameSK.getText(), ngaySK, time);
				dispose();
			}
			else 
				JOptionPane.showMessageDialog(null, "Định dạng ngày không đúng");
		}
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
