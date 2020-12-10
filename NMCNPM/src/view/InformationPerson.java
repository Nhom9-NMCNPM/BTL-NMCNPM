package view;

import java.sql.Connection;

import javax.swing.JPanel;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.border.EmptyBorder;

import model.bean.SoHoKhau;
import model.businesslogic.PersonDAO;

import java.awt.Font;
import java.awt.Color;
import java.awt.FlowLayout;

public class InformationPerson extends JPanel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public InformationPerson(Connection conn, String user) {
		SoHoKhau shk = PersonDAO.getSoHoKhau(conn, user);
		setLayout(new BorderLayout(0, 0));
		JPanel pnNorth = new JPanel();
		pnNorth.setBorder(new EmptyBorder(50, 0, 5, 0));
		pnNorth.setPreferredSize(new Dimension(10, 100));
		add(pnNorth, BorderLayout.NORTH);
		
		JLabel lbSouth = new JLabel("Thông tin cá nhân");
		lbSouth.setForeground(new Color(139, 0, 0));
		lbSouth.setFont(new Font("Calibri", Font.BOLD, 30));
		pnNorth.add(lbSouth);
		
		JPanel pnCenter = new JPanel();
		pnCenter.setBorder(new EmptyBorder(50, 0, 0, 0));
		add(pnCenter, BorderLayout.CENTER);
		pnCenter.setLayout(new BoxLayout(pnCenter, BoxLayout.Y_AXIS));
		
		JPanel pnMa = new JPanel();
		pnCenter.add(pnMa);
		
		JLabel lbM = new JLabel("Mã sổ hộ khẩu");
		lbM.setPreferredSize(new Dimension(200, 30));
		lbM.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnMa.add(lbM);
		
		JLabel lbSeparetorM = new JLabel(":");
		lbSeparetorM.setPreferredSize(new Dimension(20, 30));
		lbSeparetorM.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnMa.add(lbSeparetorM);
		
		JLabel lbSHK = new JLabel(shk.getIdSHK());
		lbSHK.setPreferredSize(new Dimension(600, 30));
		lbSHK.setForeground(new Color(0, 0, 0));
		lbSHK.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnMa.add(lbSHK);
		
		JPanel pnCH = new JPanel();
		pnCenter.add(pnCH);
		
		JLabel lbCh = new JLabel("Chủ hộ");
		lbCh.setPreferredSize(new Dimension(200, 30));
		lbCh.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnCH.add(lbCh);
		
		JLabel lbSeparetorCH = new JLabel(":");
		lbSeparetorCH.setPreferredSize(new Dimension(20, 30));
		lbSeparetorCH.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnCH.add(lbSeparetorCH);
		
		JLabel lbChuHo = new JLabel(shk.getChuHo());
		lbChuHo.setPreferredSize(new Dimension(600, 30));
		lbChuHo.setForeground(new Color(0, 0, 0));
		lbChuHo.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnCH.add(lbChuHo);
		
		JPanel pnDC = new JPanel();
		pnCenter.add(pnDC);
		
		JLabel lbDC = new JLabel("Địa chỉ");
		lbDC.setPreferredSize(new Dimension(200, 30));
		lbDC.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnDC.add(lbDC);
		
		JLabel lbSeparetorDC = new JLabel(":");
		lbSeparetorDC.setPreferredSize(new Dimension(20, 30));
		lbSeparetorDC.setFont(new Font("Tahoma", Font.BOLD, 20));
		pnDC.add(lbSeparetorDC);
		
		JLabel lbDiaChi = new JLabel(shk.getDiaChi());
		lbDiaChi.setPreferredSize(new Dimension(600, 30));
		lbDiaChi.setForeground(new Color(0, 0, 0));
		lbDiaChi.setFont(new Font("Tahoma", Font.PLAIN, 24));
		pnDC.add(lbDiaChi);
		
		JPanel panel_1 = new JPanel();
		pnCenter.add(panel_1);
		
		JPanel pnSouth = new JPanel();
		pnSouth.setPreferredSize(new Dimension(10, 150));
		add(pnSouth, BorderLayout.SOUTH);
	}
}
