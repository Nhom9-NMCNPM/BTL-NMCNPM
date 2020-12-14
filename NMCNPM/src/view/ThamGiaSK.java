package view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import model.bean.SKTheoHo;
import model.bean.SoHoKhau;
//import model.bean.SuKien;
import model.bean.ThamGia;
import model.businesslogic.AdminDAO;
import model.businesslogic.PersonDAO;


public class ThamGiaSK extends JPanel {
	private static final long serialVersionUID = 1L;
	private DefaultTableModel dtm;
	private JTable table;

	public String user = null;
	private Connection conn = null;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	private SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
	private AdminDAO adminDao = new AdminDAO();
	
	public ThamGiaSK(Connection conn, String user) {
		super();
		this.conn = conn;
		this.user = user;
		setLayout(new BorderLayout());
		addControls();
		addTable();
	}

	private void addControls() {
		JPanel panel = new JPanel();
		panel.setBorder(new EmptyBorder(10, 0, 0, 0));
		panel.setPreferredSize(new Dimension(10, 60));
		add(panel, BorderLayout.NORTH);
		panel.setLayout(new BoxLayout(panel, BoxLayout.X_AXIS));
		
		JPanel pnCenter = new JPanel(new BorderLayout());
		pnCenter.setBorder(BorderFactory.createEmptyBorder(20, 10, 10, 20));
		add(pnCenter,BorderLayout.CENTER);
		
		dtm = new DefaultTableModel() {
			public Class<?> getColumnClass(int columnIndex) {
				Class clazz = String.class;
				if(columnIndex == 4) {
					clazz = Boolean.class;
				}
				return clazz;
			}
		};
		dtm.addColumn("STT");
		dtm.addColumn("Tên sự kiện");
		dtm.addColumn("Thời gian");
		dtm.addColumn("Ngày diễn ra");
		dtm.addColumn("Trạng thái");
		dtm.addColumn("Đại diện");
		
		table = new JTable(dtm);
		table.setBackground(new Color(250, 250, 250));
		table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 15));
		table.getTableHeader().setPreferredSize(new Dimension(0, 30));
		table.setRowHeight(30);
		table.setDefaultEditor(Object.class, null);
		table.setFont(new Font("Tahoma", Font.PLAIN, 15));
		table.setEnabled(false);
		JScrollPane sc = new JScrollPane(table, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS
				, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		pnCenter.add(sc, BorderLayout.CENTER);
		
		JPanel pnSouth = new JPanel();
		pnSouth.setBorder(new EmptyBorder(5, 0, 20, 0));
		pnSouth.setPreferredSize(new Dimension(10, 60));
		add(pnSouth, BorderLayout.SOUTH);
		pnSouth.setLayout(new BoxLayout(pnSouth, BoxLayout.X_AXIS));
	}

	private void addTable() {
		dtm.setRowCount(0);
		ArrayList<SKTheoHo> list = PersonDAO.getSKTheoHo(conn, user);
		int size = list.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(list.get(i).getNameSK());
			vec.add(sdf1.format(list.get(i).getTime()));
			vec.add(sdf.format(list.get(i).getNgaySK()));
			vec.add(list.get(i).getStatus());
			vec.add(list.get(i).getNguoiDaiDien());
			dtm.addRow(vec);
		}	
	}
}
