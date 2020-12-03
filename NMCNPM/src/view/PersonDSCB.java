package view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import model.bean.CanBo;
import model.businesslogic.PersonDAO;
import java.awt.FlowLayout;
import javax.swing.JLabel;

public class PersonDSCB extends JPanel{
	
	private static final long serialVersionUID = 1L;
	private DefaultTableModel dtm;
	private JTable table;
	private Connection conn=null;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
	public PersonDSCB(Connection conn) {
		super();
		this.conn = conn;
		setLayout(new BorderLayout());
		addControls();
		addTable();
	}
	
	private void addTable() {
		
		dtm.setRowCount(0);
		ArrayList<CanBo> listCB = PersonDAO.getDSCB(conn);
		int size = listCB.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(listCB.get(i).getTenCB());
			vec.add(sdf.format(listCB.get(i).getBirthCB()));
			vec.add(listCB.get(i).getChucVu());
			vec.add(listCB.get(i).getPhone());
			vec.add(listCB.get(i).getEmail());
			dtm.addRow(vec);
		}
	}

	private void addControls() {
		
		JPanel pnNorth = new JPanel();
		pnNorth.setBorder(new EmptyBorder(30, 0, 0, 0));
		pnNorth.setPreferredSize(new Dimension(10, 80));
		add(pnNorth, BorderLayout.NORTH);
		pnNorth.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		JLabel lbNorth = new JLabel("Danh sách cán bộ");
		lbNorth.setPreferredSize(new Dimension(223, 35));
		lbNorth.setForeground(new Color(139, 0, 0));
		lbNorth.setFont(new Font("Calibri", Font.BOLD, 30));
		pnNorth.add(lbNorth);

		
		JPanel pnCenter = new JPanel(new BorderLayout());
		pnCenter.setBorder(BorderFactory.createEmptyBorder(20, 10, 10, 20));
		add(pnCenter,BorderLayout.CENTER);
		
		dtm = new DefaultTableModel();
		dtm.addColumn("STT");
		dtm.addColumn("Tên cán bộ");
		dtm.addColumn("Ngày sinh");
		dtm.addColumn("Chức vụ");
		dtm.addColumn("Số điện thoại");
		dtm.addColumn("Email");
		
		table = new JTable(dtm);
		table.setEnabled(false);
		table.setBackground(new Color(250, 250, 250));
		table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 15));
		table.getTableHeader().setPreferredSize(new Dimension(0, 30));
		table.setRowHeight(30);
		table.setDefaultEditor(Object.class, null);
		table.setFont(new Font("Tahoma", Font.PLAIN, 15));
		JScrollPane sc = new JScrollPane(table, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS
				, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		pnCenter.add(sc, BorderLayout.CENTER);	
	}
}