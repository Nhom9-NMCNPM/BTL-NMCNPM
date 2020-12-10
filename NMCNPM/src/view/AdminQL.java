package view;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import javax.swing.JButton;
import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import model.bean.SuKien;
import model.businesslogic.AdminDAO;
import view.AdminQL.PressKey;

import javax.swing.JComboBox;
import javax.swing.JOptionPane;
//import view.AdminQL.PressKey;

public class AdminQL extends JPanel {

	
	private static final long serialVersionUID = 1L;
	private DefaultTableModel dtm;
	private JTable table;
	private Connection conn=null;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	private SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
	private JTextField txtSearch;
	private int tool = 1;
	private String tools[] = {"Mã","Tên","Năm"};
	private String maSK=null;
	private String nameSK = null;
	private String ngaySK = null;
	private String time = null;
	private JComboBox<String> cbSearch = new JComboBox<String>(tools);
	private JButton btnNew = new JButton("Tạo mới");
	private JButton btnSearch = new JButton("Tìm kiếm");
	private JButton btnSend = new JButton("Gửi thông báo");
	private JButton btnUpdate = new JButton("Cập nhật");
	private JButton btnDelete = new JButton("Xóa");
	private JButton btnSua = new JButton("Sửa");
	private AdminDAO adminDao = new AdminDAO();
	private PressKey press = new PressKey();
	private int viTri = -1;
	public AdminQL(Connection conn) {
		super();
		this.conn = conn;
		setLayout(new BorderLayout());
		addControls();
		addEvents();
		addTable();

	}
	
	private void addTable() {
		reset();
		dtm.setRowCount(0);
		ArrayList<SuKien> listSK = adminDao.getSuKien(conn);
		int size = listSK.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(listSK.get(i).getIdSK());
			vec.add(listSK.get(i).getNameSK());
			vec.add(sdf1.format(listSK.get(i).getTime()));
			vec.add(sdf.format(listSK.get(i).getNgaySK()));
			dtm.addRow(vec);
		}
	}
	
	private void addControls() {
		JPanel panel = new JPanel();
		panel.setBorder(new EmptyBorder(10, 0, 0, 0));
		panel.setPreferredSize(new Dimension(10, 60));
		add(panel, BorderLayout.NORTH);
		panel.setLayout(new BoxLayout(panel, BoxLayout.X_AXIS));
		
		JPanel panel_3 = new JPanel();
		panel.add(panel_3);
		
		JPanel panel_1 = new JPanel();
		panel_1.setPreferredSize(new Dimension(120, 40));
		panel.add(panel_1);
		
		btnNew.setPreferredSize(new Dimension(100, 25));
		panel_1.add(btnNew);
		
		JPanel panel_2 = new JPanel();
		panel_2.setPreferredSize(new Dimension(250, 40));
		panel.add(panel_2);
		
		txtSearch = new JTextField();
		txtSearch.addKeyListener(press);
		txtSearch.setPreferredSize(new Dimension(6, 28));
		txtSearch.setFont(new Font("Tahoma", Font.PLAIN, 14));
		txtSearch.setColumns(13);
		panel_2.add(txtSearch);
		
		cbSearch.setPreferredSize(new Dimension(70, 25));
		cbSearch.setSelectedIndex(tool);
		panel_2.add(cbSearch);
		
		btnSearch.setPreferredSize(new Dimension(100, 25));
		panel_2.add(btnSearch);
		
		JPanel panel_4 = new JPanel();
		panel.add(panel_4);
		
		JPanel pnCenter = new JPanel(new BorderLayout());
		pnCenter.setBorder(BorderFactory.createEmptyBorder(20, 10, 10, 20));
		add(pnCenter,BorderLayout.CENTER);
		
		dtm = new DefaultTableModel();
		dtm.addColumn("STT");
		dtm.addColumn("Mã sự kiện");
		dtm.addColumn("Tên sự kiện");
		dtm.addColumn("Thời gian");
		dtm.addColumn("Ngày diễn ra");
		
		table = new JTable(dtm);
		table.setBackground(new Color(250, 250, 250));
		table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 15));
		table.getTableHeader().setPreferredSize(new Dimension(0, 30));
		table.setRowHeight(30);
		table.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
		table.setDefaultEditor(Object.class, null);
		table.setFont(new Font("Tahoma", Font.PLAIN, 15));

		JScrollPane sc = new JScrollPane(table, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS
				, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		pnCenter.add(sc, BorderLayout.CENTER);
		
		JPanel pnSouth = new JPanel();
		pnSouth.setBorder(new EmptyBorder(5, 0, 20, 0));
		pnSouth.setPreferredSize(new Dimension(10, 60));
		add(pnSouth, BorderLayout.SOUTH);
		pnSouth.setLayout(new BoxLayout(pnSouth, BoxLayout.X_AXIS));
		
		JPanel panel_5 = new JPanel();
		pnSouth.add(panel_5);
		
		btnSua.setPreferredSize(new Dimension(100, 25));
		panel_5.add(btnSua);
		
		JPanel panel_6 = new JPanel();
		pnSouth.add(panel_6);
		
		btnDelete.setPreferredSize(new Dimension(100, 25));
		panel_6.add(btnDelete);
		
		JPanel panel_7 = new JPanel();
		pnSouth.add(panel_7);
		
		btnUpdate.setPreferredSize(new Dimension(100, 25));
		panel_7.add(btnUpdate);
		
		JPanel panel_8 = new JPanel();
		pnSouth.add(panel_8);
		
		btnSend.setPreferredSize(new Dimension(125, 25));
		panel_8.add(btnSend);
		
		btnDelete.setFocusPainted(false);
		btnNew.setFocusPainted(false);
		btnSearch.setFocusPainted(false);
		btnSua.setFocusPainted(false);
		btnUpdate.setFocusPainted(false);
		btnSend.setFocusPainted(false);
		
	}
	private void addEvents() {
		btnNew.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new NewSK(conn);
				addTable();
			}
		});
		
		btnDelete.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(maSK != null) {
					adminDao.xoaSuKien(conn, maSK);
					addTable();
				}
			}
		});
		
		btnUpdate.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(maSK != null)
					new UpdateSK(maSK, nameSK, conn);
			}
		});
		
		btnSearch.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String txt = txtSearch.getText();
				if (txt == null) {
					addTable();
				}
				else
					xuLyTim(txt, tool);
				txtSearch.setText("");
			}
		});
		
		cbSearch.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				tool = cbSearch.getSelectedIndex();
			}
		});
		
		btnSend.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(nameSK != null) {
					if( adminDao.checkDate(ngaySK)) {
						boolean check = adminDao.sendTB(conn,ngaySK, time, nameSK);
						if(check) {
							JOptionPane.showMessageDialog(null, "Gửi thành công");
						}
						else {
							JOptionPane.showMessageDialog(null, "Có lỗi xảy ra trong quá trình gửi", "Error", JOptionPane.ERROR_MESSAGE);
						}
					}
					else {
						JOptionPane.showMessageDialog(null, "Sự kiện đã qua hoặc đã gần diễn ra vui lòng thử lại",
								"Error", JOptionPane.ERROR_MESSAGE);
					}
				}
			}
		});
		
		btnSua.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(viTri != -1) {
					new ChangeSK(conn, maSK, nameSK, ngaySK, time);
					addTable();
				}
			}
		});
		
		table.addMouseListener(new MouseListener() {
			
			public void mouseReleased(MouseEvent e) {
				
			}
			
			@Override
			public void mousePressed(MouseEvent e) {
				viTri = table.getSelectedRow();
				if(viTri != -1) {
					maSK = (String) table.getValueAt(viTri, 1);
					nameSK = (String) table.getValueAt(viTri, 2);
					ngaySK = (String) table.getValueAt(viTri, 4);
					time = (String) table.getValueAt(viTri, 3);
				}
			}

			public void mouseExited(MouseEvent e) {
				
			}

			public void mouseEntered(MouseEvent e) {
				
			}
			public void mouseClicked(MouseEvent e) {
				
			}
		});
		
	}
	protected void xuLyTim(String txt, int tool) {
		reset();
		dtm.setRowCount(0);
		ArrayList<SuKien> listSK = adminDao.getSKBangTK(conn, txt, tool);
		int size = listSK.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(listSK.get(i).getIdSK());
			vec.add(listSK.get(i).getNameSK());
			vec.add(sdf1.format(listSK.get(i).getTime()));
			vec.add(sdf.format(listSK.get(i).getNgaySK()));
			dtm.addRow(vec);
		}
	}
	
	protected void reset() {
		maSK = null;
		viTri = -1;
		nameSK = null;
		ngaySK = null;
		time = null;
	}
	class PressKey implements KeyListener{

		public void keyTyped(KeyEvent e) {
		
		}

		public void keyPressed(KeyEvent e) {
			if(e.getKeyCode() == KeyEvent.VK_ENTER) {
				btnSearch.doClick();
			}
		}

		public void keyReleased(KeyEvent e) {
			
		}	
	}
}
