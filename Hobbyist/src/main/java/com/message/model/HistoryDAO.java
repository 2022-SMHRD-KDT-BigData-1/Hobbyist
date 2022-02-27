package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HistoryDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	




	//connect는 DB연결기능을 하는 메소드
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user="campus_f_5_0115";
			String password="smhrd5";
			
			conn= DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
	}
	
	//연결 종료 기능
	public void close() {
		try {
			if(rs !=null) {
				rs.close();
			}
			if(psmt !=null) {
				psmt.close();
			}
			if(conn !=null) {
				conn.close();
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}
	}
	public ArrayList<HistoryDTO> H_Select(String email) {

		ArrayList<HistoryDTO> list = new ArrayList<HistoryDTO>();

		connect();

		sql = "select *"
				+ " from history h, addr ad where h.ac_id=ad.ac_id"
				+ " and m_email=?"
				+ " order by h_seq";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new HistoryDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public ArrayList<AddrDTO> H_Select2(String email) {

		ArrayList<AddrDTO> list = new ArrayList<AddrDTO>();

		connect();

		sql = "select *"
				+ " from history h, addr ad where h.ac_id=ad.ac_id"
				+ " and m_email=?"
				+ " order by h_seq";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new AddrDTO(null,rs.getString(7),null,null,null,rs.getString(11),null,null,null,rs.getString(15),null,null));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public String selectAc_id(String classname) {
		String ac_id = null;
		connect();

		sql = "select ac_id from addr where ac_name = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, classname);
			rs = psmt.executeQuery();

			if (rs.next()) {
				ac_id = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return ac_id;
	}
	
	public int historyCreate(HistoryDTO his) {

		connect();
		sql = "insert into history values(num_seq.nextval, ?, ?, ?,?)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, his.getH_day());
			psmt.setString(2, his.getH_time());
			psmt.setString(3, his.getAc_id());
			psmt.setString(4, his.getM_email());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

}
