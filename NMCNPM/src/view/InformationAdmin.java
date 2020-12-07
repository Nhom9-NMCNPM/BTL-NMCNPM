package view;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.border.EmptyBorder;

import model.bean.CanBo;
import model.businesslogic.AdminDAO;

import java.awt.Font;
import java.awt.Color;
import javax.swing.BoxLayout;

public class InformationAdmin extends JPanel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Create the panel.
	 */
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	public InformationAdmin(Connection conn,String user) {
		setLayout(new BorderLayout(0, 0));
		CanBo cb = AdminDAO.getCanBo(conn, user);
		JPanel pnNorth = new JPanel();
		pnNorth.setBorder(new EmptyBorder(50, 0, 50, 0));
		pnNorth.setPreferredSize(new Dimension(10, 150));
		add(pnNorth, BorderLayout.NORTH);
		
		JLabel lbNorth = new JLabel("Thông tin cá nhân");
		lbNorth.setForeground(new Color(139, 0, 0));
		lbNorth.setFont(new Font("Calibri", Font.BOLD, 30));
		pnNorth.add(lbNorth);
		
		JPanel pnCenter = new JPanel();
		add(pnCenter, BorderLayout.CENTER);
		pnCenter.setLayout(new BoxLayout(pnCenter, BoxLayout.Y_AXIS));
		
		JPanel pnM = new JPanel();
		pnCenter.add(pnM);
		
		JLabel lbM = new JLabel("Mã cán bộ");
		lbM.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbM.setPreferredSize(new Dimension(200, 30));
		pnM.add(lbM);
		
		JLabel lbSeperator = new JLabel(":");
		lbSeperator.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator.setPreferredSize(new Dimension(25, 30));
		pnM.add(lbSeperator);
		
		JLabel lbMa = new JLabel(cb.getMaCB());
		lbMa.setPreferredSize(new Dimension(600, 30));
		lbMa.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnM.add(lbMa);
		
		JPanel pnName = new JPanel();
		JLabel lbN = new JLabel("Tên cán bộ");
		lbN.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbN.setPreferredSize(new Dimension(200, 30));
		pnName.add(lbN);
		
		JLabel lbSeperator1 = new JLabel(":");
		lbSeperator1.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator1.setPreferredSize(new Dimension(25, 30));
		pnName.add(lbSeperator1);
		
		JLabel lbName = new JLabel(cb.getTenCB());
		lbName.setPreferredSize(new Dimension(600, 30));
		lbName.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnName.add(lbName);
		pnCenter.add(pnName);
		
		JPanel pnBirth = new JPanel();
		JLabel lbB = new JLabel("Ngày sinh");
		lbB.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbB.setPreferredSize(new Dimension(200, 30));
		pnBirth.add(lbB);
		
		JLabel lbSeperator2 = new JLabel(":");
		lbSeperator2.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator2.setPreferredSize(new Dimension(25, 30));
		pnBirth.add(lbSeperator2);
		
		JLabel lbBirth = new JLabel(sdf.format(cb.getBirthCB()));
		lbBirth.setPreferredSize(new Dimension(600, 30));
		lbBirth.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnBirth.add(lbBirth);
		pnCenter.add(pnBirth);
		
		JPanel pnCV = new JPanel();
		JLabel lbC = new JLabel("Chức vụ");
		lbC.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbC.setPreferredSize(new Dimension(200, 30));
		pnCV.add(lbC);
		
		JLabel lbSeperator3 = new JLabel(":");
		lbSeperator3.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator3.setPreferredSize(new Dimension(25, 30));
		pnCV.add(lbSeperator3);
		
		JLabel lbCV = new JLabel(cb.getChucVu());
		lbCV.setPreferredSize(new Dimension(600, 30));
		lbCV.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnCV.add(lbCV);
		pnCenter.add(pnCV);
		
		JPanel pnPhone = new JPanel();
		JLabel lbP = new JLabel("Số điện thoại");
		lbP.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbP.setPreferredSize(new Dimension(200, 30));
		pnPhone.add(lbP);
		
		JLabel lbSeperator4 = new JLabel(":");
		lbSeperator4.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator4.setPreferredSize(new Dimension(25, 30));
		pnPhone.add(lbSeperator4);
		
		JLabel lbPhone = new JLabel(cb.getPhone());
		lbPhone.setPreferredSize(new Dimension(600, 30));
		lbPhone.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnPhone.add(lbPhone);
		pnCenter.add(pnPhone);
		
		JPanel pnEmail = new JPanel();
		JLabel lbE = new JLabel("Email");
		lbE.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbE.setPreferredSize(new Dimension(200, 30));
		pnEmail.add(lbE);
		
		JLabel lbSeperator5 = new JLabel(":");
		lbSeperator5.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSeperator5.setPreferredSize(new Dimension(25, 30));
		pnEmail.add(lbSeperator5);
		
		JLabel lbEmail = new JLabel(cb.getEmail());
		lbEmail.setPreferredSize(new Dimension(600, 30));
		lbEmail.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnEmail.add(lbEmail);
		pnCenter.add(pnEmail);
		
		JPanel pnSouth = new JPanel();
		pnSouth.setPreferredSize(new Dimension(10, 100));
		add(pnSouth, BorderLayout.SOUTH);

	}
}
