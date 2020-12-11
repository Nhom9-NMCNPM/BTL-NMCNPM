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
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import model.businesslogic.AdminDAO;
import view.NewSK.PressKey;

public class NewSK extends JDialog {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JTextField txtMaSK;
	private JTextField txtNameSK;
	private AdminDAO adminDao = new AdminDAO();
	private Connection conn = null;
	private JComboBox<Integer> cbDay = new JComboBox<Integer>();
	private JComboBox<Integer> cbMonth = new JComboBox<Integer>();
	private JComboBox<Integer> cbYear = new JComboBox<Integer>();
	private JComboBox<Integer> cbGio = new JComboBox<Integer>();
	private JComboBox<Integer> cbPhut = new JComboBox<Integer>();
	private JButton btnExit = new JButton("Thoát");
	private JButton btnAdd = new JButton("Tạo");
	private PressKey press;
	public NewSK(Connection conn) {
		this.conn = conn;
		setTitle("Tạo sự kiện");
		setSize(600, 500);
		setResizable(false);
		setModal(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		getContentPane().setLayout(null);
		press = new PressKey();
		JLabel lblNewLabel = new JLabel("Mã sự kiện:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 17));
		lblNewLabel.setBounds(120, 70, 128, 30);
		getContentPane().add(lblNewLabel);
		
		txtMaSK = new JTextField();
		txtMaSK.addKeyListener(press);
		txtMaSK.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtMaSK.setBounds(254, 72, 186, 30);
		getContentPane().add(txtMaSK);
		txtMaSK.setColumns(15);
		
		JLabel lblNewLabel_1 = new JLabel("Tên sự kiện:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 17));
		lblNewLabel_1.setBounds(120, 148, 128, 30);
		getContentPane().add(lblNewLabel_1);
		
		txtNameSK = new JTextField();
		txtNameSK.addKeyListener(press);
		txtNameSK.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtNameSK.setBounds(254, 150, 186, 30);
		getContentPane().add(txtNameSK);
		txtNameSK.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Ngày bắt đầu:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 17));
		lblNewLabel_2.setBounds(120, 224, 128, 30);
		getContentPane().add(lblNewLabel_2);
		
		btnAdd.setBounds(194, 387, 97, 25);
		getContentPane().add(btnAdd);
		
		btnExit.setBounds(316, 387, 97, 25);
		getContentPane().add(btnExit);
		
		cbDay.setPreferredSize(new Dimension(30, 25));
		cbDay.setBounds(254, 229, 50, 25);
		for(int i = 1 ; i<=31 ; i++) {
			cbDay.addItem(i);
		}
		getContentPane().add(cbDay);
		
		cbMonth.setPreferredSize(new Dimension(30, 25));
		cbMonth.setBounds(316, 229, 50, 25);
		for(int i = 1 ; i<=12 ; i++) {
			cbMonth.addItem(i);
		}
		getContentPane().add(cbMonth);

		cbYear.setPreferredSize(new Dimension(30, 25));
		cbYear.setBounds(378, 229, 60, 25);
		for(int i = 2019 ; i<=2021 ; i++) {
			cbYear.addItem(i);
		}
		getContentPane().add(cbYear);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mo = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int h = cal.get(Calendar.HOUR);
		int m = cal.get(Calendar.MINUTE);
		cbYear.setSelectedItem(year);
		cbMonth.setSelectedItem(mo);
		cbDay.setSelectedItem(day);
		
		JLabel lbTime = new JLabel("Thời gian:");
		lbTime.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbTime.setBounds(120, 299, 128, 30);
		getContentPane().add(lbTime);
		
		cbGio.setBounds(254, 304, 50, 25);
		for(int i = 0 ; i<=23; i++) {
			cbGio.addItem(i);
		}
		getContentPane().add(cbGio);
		JLabel lbGio = new JLabel("Giờ");
		lbGio.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbGio.setBounds(310, 299, 38, 30);
		getContentPane().add(lbGio);
		
		cbPhut.setBounds(346, 305, 50, 25);
		for(int i = 0 ; i<=59; i++) {
			cbPhut.addItem(i);;
		}
		getContentPane().add(cbPhut);
		cbGio.setSelectedItem(h);
		cbPhut.setSelectedItem(m);
		JLabel lbPhut = new JLabel("Phút");
		lbPhut.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbPhut.setBounds(401, 299, 56, 30);
		getContentPane().add(lbPhut);
		addEvents();
		setVisible(true);
	}
	
	private void addEvents() {
		btnAdd.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				xuLyThem();
			}
		});
		btnExit.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
	}
	
	protected void xuLyThem() {
		if (txtMaSK.getText().length() == 0 || txtNameSK.getText().length() == 0) {
			JOptionPane.showMessageDialog(null, "Nhập thiếu dữ liệu!");
			return;
		}
		else{
			if (adminDao.ktTonTai(conn, txtMaSK.getText())== true) {
				JOptionPane.showMessageDialog(null, "Trùng mã sự kiện");
				txtMaSK.setText("");
			}
			else {
				int day= (int) cbDay.getSelectedItem();
				int month= (int) cbMonth.getSelectedItem();
				int year= (int) cbYear.getSelectedItem();
				String ngaySK= year+"-"+ month+"-"+day;
				boolean check= adminDao.xuLyNgay(day, month, year);
				int gio = (int) cbGio.getSelectedItem();
				int phut = (int) cbPhut.getSelectedItem();
				String time = gio+":"+phut+":"+"00";
				if (check== true) {
					adminDao.getTaoSuKien(conn, txtMaSK.getText(), txtNameSK.getText(), ngaySK, time);
					dispose();
				}
				else 
					JOptionPane.showMessageDialog(null, "Định dạng ngày không đúng");
			}
		}
	}
	
	public class PressKey implements KeyListener{

		public void keyTyped(KeyEvent e) {
		
		}

		public void keyPressed(KeyEvent e) {
			if(e.getKeyCode() == KeyEvent.VK_ENTER) {
				btnAdd.doClick();
			}
		}

		public void keyReleased(KeyEvent e) {
			
		}	
	}

}
