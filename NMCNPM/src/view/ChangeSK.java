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
import javax.swing.JLabel;
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
		JLabel lblNewLabel = new JLabel("Mã sự kiện:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 17));
		lblNewLabel.setBounds(120, 70, 128, 30);
		getContentPane().add(lblNewLabel);
		
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
		txtNameSK.setText(tenSK);
		
		JLabel lblNewLabel_2 = new JLabel("Ngày bắt đầu:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 17));
		lblNewLabel_2.setBounds(120, 224, 128, 30);
		getContentPane().add(lblNewLabel_2);
		
		btnU.setBounds(194, 387, 97, 25);
		getContentPane().add(btnU);
		
		btnExit.setBounds(316, 387, 97, 25);
		getContentPane().add(btnExit);
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		int d=0,m=0,y=0,h=0,p=0;
		try {
			Date ng = sdf.parse(ngaySK);
			Date ti = sdf1.parse(timeSK);
			cal.setTime(ng);
			d = cal.get(Calendar.DAY_OF_MONTH);
			m = cal.get(Calendar.MONTH)+1;
			y = cal.get(Calendar.YEAR);
			h = ti.getHours();
			p = ti.getMinutes();
		} catch (ParseException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),"Error",JOptionPane.ERROR_MESSAGE);
		}
		cbDay.setPreferredSize(new Dimension(30, 25));
		cbDay.setBounds(254, 229, 50, 25);
		for(int i = 1 ; i<=31 ; i++) {
			cbDay.addItem(i);
		}
		getContentPane().add(cbDay);
		cbDay.setSelectedItem(d);
		
		cbMonth.setPreferredSize(new Dimension(30, 25));
		cbMonth.setBounds(316, 229, 50, 25);
		for(int i = 1 ; i<=12 ; i++) {
			cbMonth.addItem(i);
		}
		getContentPane().add(cbMonth);
		cbMonth.setSelectedItem(m);

		cbYear.setPreferredSize(new Dimension(30, 25));
		cbYear.setBounds(378, 229, 60, 25);
		for(int i = 2019 ; i<=2021 ; i++) {
			cbYear.addItem(i);
		}
		getContentPane().add(cbYear);
		cbYear.setSelectedItem(y);
		
		JLabel lbTime = new JLabel("Thời gian:");
		lbTime.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbTime.setBounds(120, 299, 128, 30);
		getContentPane().add(lbTime);
		
		cbGio.setBounds(254, 304, 50, 25);
		for(int i = 0 ; i<=23; i++) {
			cbGio.addItem(i);
		}
		getContentPane().add(cbGio);
		cbGio.setSelectedItem(h);
		
		JLabel lbGio = new JLabel("Giờ");
		lbGio.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbGio.setBounds(310, 299, 38, 30);
		getContentPane().add(lbGio);
		
		cbPhut.setBounds(346, 305, 50, 25);
		for(int i = 0 ; i<=59; i++) {
			cbPhut.addItem(i);;
		}
		getContentPane().add(cbPhut);
		cbPhut.setSelectedItem(p);
		
		JLabel lbPhut = new JLabel("Phút");
		lbPhut.setFont(new Font("Tahoma", Font.BOLD, 17));
		lbPhut.setBounds(401, 299, 56, 30);
		getContentPane().add(lbPhut);
		
		JLabel lbMaSK = new JLabel(maSK);
		lbMaSK.setFont(new Font("Calibri", Font.PLAIN, 20));
		lbMaSK.setBounds(260, 72, 176, 30);
		getContentPane().add(lbMaSK);
		addEvents();
		setVisible(true);
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
