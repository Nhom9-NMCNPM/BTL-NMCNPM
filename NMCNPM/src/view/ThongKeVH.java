package view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import model.bean.SKTheoHo;
import model.bean.ThongKe;
import model.businesslogic.AdminDAO;
import model.businesslogic.PersonDAO;

public class ThongKeVH extends JPanel {

	private static final long serialVersionUID = 1L;
	private DefaultTableModel dtm;
	private JTable table;
	private Connection conn = null;
	private AdminDAO adminDAO= new AdminDAO();
	
	public ThongKeVH(Connection conn) {
		super();
		this.conn = conn;
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
		
		dtm = new DefaultTableModel(){

			public Class<?> getColumnClass(int columnIndex) {
		      Class clazz = String.class;
		      if(columnIndex == 4) {
		    	  clazz = Boolean.class;
		      }
		      return clazz;
		    }
		};
		dtm.addColumn("STT");
		dtm.addColumn("Mã sổ hộ khẩu");
		dtm.addColumn("Tên chủ hộ");
		dtm.addColumn("Số lần");
		dtm.addColumn("Đạt điều kiện văn hoá");
		
		table = new JTable(dtm);
		table.setEnabled(false);
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
		ArrayList<ThongKe> listTG = adminDAO.getThongKe(conn) ;
		int sl = adminDAO.soSK(conn);
		int l;
		int size = listTG.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(listTG.get(i).getIdSHK());
			vec.add(listTG.get(i).getChuHo());
			l = listTG.get(i).getSolan();
			vec.add(l+"/"+ sl );
			if(l >= sl*2/3) {
				vec.add(true);
			}
			else {
				vec.add(false);
			}
			dtm.addRow(vec);
		}
	}
}