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
	public ArrayList<HistoryDTO> H_Select() {

		ArrayList<HistoryDTO> list = new ArrayList<HistoryDTO>();

		connect();

		sql = "select h_seq, a_name, h_day,h_time, a_city, h_tel"
				+ " from history"
				+ " order by h_seq";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new HistoryDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

}
