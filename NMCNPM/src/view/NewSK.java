package view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import model.businesslogic.AdminDAO;
import view.NewSK.PressKey;

public class NewSK extends JDialog {
	private static final long serialVersionUID = 1L;
	private JTextField txtMaSK;
	private JTextField txtNameSK;
	private AdminDAO adminDao = new AdminDAO();
	private static Connection conn = null;
	private JComboBox<Integer> cbDay = new JComboBox<Integer>();
	private JComboBox<Integer> cbMonth = new JComboBox<Integer>();
	private JComboBox<Integer> cbYear = new JComboBox<Integer>();
	private JComboBox<Integer> cbGio = new JComboBox<Integer>();
	private JComboBox<Integer> cbPhut = new JComboBox<Integer>();
	private JButton btnExit = new JButton("Thoát");
	private JButton btnAdd = new JButton("Tạo");
	private PressKey press;
	private final JPanel contentPanel = new JPanel();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			NewSK dialog = new NewSK(conn);
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public NewSK(Connection conn) {
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setLayout(new FlowLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				JButton okButton = new JButton("OK");
				okButton.setActionCommand("OK");
				buttonPane.add(okButton);
				getRootPane().setDefaultButton(okButton);
			}
			{
				JButton cancelButton = new JButton("Cancel");
				cancelButton.setActionCommand("Cancel");
				buttonPane.add(cancelButton);
			}
		}
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
