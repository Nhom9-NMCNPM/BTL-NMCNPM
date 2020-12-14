package view;

import javax.swing.JDialog;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

import model.bean.ThamGia;
import model.businesslogic.AdminDAO;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.DefaultCellEditor;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.border.EmptyBorder;
import javax.swing.JScrollPane;

public class UpdateSK extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maSK;
	private String nameSK;
	private Connection conn=null;
	private DefaultTableModel dtm;
	private JTable table;
	private JPanel pnNorth;
	private JLabel lbMaSK;
	private String maSHK = null;
	private JLabel lbNameSK;
	private JComboBox<String> cbName = new JComboBox<String>();
	private JCheckBox cbSelectAll;
	private AdminDAO adminDA0 = new AdminDAO();
	public UpdateSK(String maSK, String nameSK, Connection conn) {
		this.conn = conn;
		this.maSK = maSK;
		this.nameSK = nameSK;
		this.lbMaSK = new JLabel(""+this.maSK);
		lbMaSK.setFont(new Font("Tahoma", Font.BOLD, 14));
		this.lbNameSK = new JLabel(""+this.nameSK);
		lbNameSK.setFont(new Font("Tahoma", Font.BOLD, 14));
		setTitle("Cập nhật");
		setSize(1200, 750);
		setResizable(false);
		setModal(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		getContentPane().setLayout(new BorderLayout(0, 0));
		
		pnNorth = new JPanel();
		pnNorth.setBorder(new EmptyBorder(0, 0, 10, 0));
		pnNorth.setPreferredSize(new Dimension(10, 80));
		getContentPane().add(pnNorth, BorderLayout.NORTH);
		pnNorth.setLayout(new BoxLayout(pnNorth, BoxLayout.Y_AXIS));
		
		JPanel panel = new JPanel();
		panel.setBorder(new EmptyBorder(5, 0, 0, 0));
		pnNorth.add(panel);
		
		JLabel lblNewLabel = new JLabel("Mã sự kiện:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setPreferredSize(new Dimension(95, 16));
		panel.add(lblNewLabel);
		
		
		panel.add(lbMaSK);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBorder(new EmptyBorder(5, 0, 0, 0));
		pnNorth.add(panel_1);
		
		JLabel lblNewLabel_2 = new JLabel("Tên sự kiện:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_2.setPreferredSize(new Dimension(95, 16));
		panel_1.add(lblNewLabel_2);
		
		panel_1.add(lbNameSK);
		
		JPanel pnCenter = new JPanel();
		pnCenter.setBorder(new EmptyBorder(0, 5, 5, 5));
		getContentPane().add(pnCenter, BorderLayout.CENTER);
		pnCenter.setLayout(new BorderLayout(0, 0));
		
		dtm = new DefaultTableModel() {

			public Class<?> getColumnClass(int columnIndex) {
		      Class clazz = String.class;
		      if(columnIndex == 3) {
		    	  clazz = Boolean.class;
		      }
		      return clazz;
		    }

		    public boolean isCellEditable(int row, int column) {
		    	if(column == 3) {
		    		return true;
		    	}
		    	if(column == 4) {
		    		maSHK = (String) table.getValueAt(row, 1);
		    		ArrayList<String> listNK = adminDA0.getNhanKhau(conn, maSHK);
		    		cbName.removeAllItems();
		    		for(String nk: listNK) {
		    			cbName.addItem(nk);
		    		}
		    		try {
		    			Thread.sleep(50);
		    		} catch (InterruptedException e) {
		    			e.printStackTrace();
		    		}
		    		return true;
		    	}
		    	
		    	return false;
		    }

		    public void setValueAt(Object aValue, int row, int column) {
		    	if (aValue instanceof Boolean && column == 3) {
		    		Vector rowData = (Vector)getDataVector().get(row);
		    		rowData.set(3, (boolean)aValue);
		    		fireTableCellUpdated(row, column);
		    		String shk = (String) table.getValueAt(row, 1);
		    		adminDA0.updateStatus(conn, maSK, shk, (boolean)aValue);
		    		addTable();
		    	}
		    	if (column == 4) {
		    		Vector rowData = (Vector)getDataVector().get(row);
		    		rowData.set(4, (String)aValue);
		    		fireTableCellUpdated(row, column);
		    		boolean k = (boolean) table.getValueAt(row, 3);
		    		if((String)aValue != null && k == true) {
		    			adminDA0.updateDaiDien(conn, maSK, maSHK, (String)aValue);
		    		}
		    		addTable();
		    	}
		    }
		};
		dtm.addColumn("STT");
		dtm.addColumn("Mã sổ hộ khẩu");
		dtm.addColumn("Tên chủ hộ");
		dtm.addColumn("Tham gia");
		dtm.addColumn("Người đại diện");
		
		table = new JTable(dtm);
		table.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 14));
		table.getTableHeader().setPreferredSize(new Dimension(0, 35));
		table.setRowHeight(30);
		table.setFont(new Font("Tahoma", Font.PLAIN, 15));
		TableColumn tbCL = table.getColumnModel().getColumn(4);
		tbCL.setCellEditor(new DefaultCellEditor(cbName));
		JScrollPane sc = new JScrollPane(table, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		pnCenter.add(sc, BorderLayout.CENTER);
		
		JPanel pnSouth = new JPanel();
		pnSouth.setBorder(new EmptyBorder(0, 0, 10, 0));
		pnSouth.setPreferredSize(new Dimension(10, 40));
		getContentPane().add(pnSouth, BorderLayout.SOUTH);
		pnSouth.setLayout(new BoxLayout(pnSouth, BoxLayout.X_AXIS));
		
		JPanel panel_2 = new JPanel();
		pnSouth.add(panel_2);
		
		JPanel panel_3 = new JPanel();
		pnSouth.add(panel_3);
		
		JPanel panel_4 = new JPanel();
		pnSouth.add(panel_4);
		
		JPanel panel_5 = new JPanel();
		pnSouth.add(panel_5);
		
		cbSelectAll = new JCheckBox("Chọn tất cả");
		cbSelectAll.setFont(new Font("Tahoma", Font.BOLD, 15));
		cbSelectAll.setPreferredSize(new Dimension(120, 25));
		panel_5.add(cbSelectAll);
		
		JPanel panel_6 = new JPanel();
		pnSouth.add(panel_6);
		addTable();
		addEvents();
		setVisible(true);
	}

	private void addEvents() {
		cbSelectAll.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(cbSelectAll.isSelected()) {
					adminDA0.upDateAll(conn,maSK, true);
				}
				else {
					adminDA0.upDateAll(conn,maSK, false);
				}
				addTable();
			}
		});
	}

	private void addTable() {
		reset();
		dtm.setRowCount(0);
		ArrayList<ThamGia> listTG = adminDA0.getThamGiaTheoSuKien(conn, maSK);
		int size = listTG.size();
		for(int i = 0; i<size ; i++) {
			Vector<Object> vec = new Vector<Object>();
			vec.add(i+1);
			vec.add(listTG.get(i).getIdSHK());
			vec.add(listTG.get(i).getChuHo());
			vec.add(listTG.get(i).getStatus());
			vec.add(listTG.get(i).getDaiDien());
			dtm.addRow(vec);
		}
	}
	private void reset() {
		maSHK = null;
	}
}

