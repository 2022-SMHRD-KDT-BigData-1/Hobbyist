package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WishlistDAO {
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
	public ArrayList<WishlistDTO> WishListSelectAll(String m_email) {
		ArrayList<WishlistDTO> list = new ArrayList<WishlistDTO>();
		connect();
		try {

			String sql = "select w_seq, a_name, a_city, a_address, a_tel where m_email=?";
			// 학원 id가 ?인 학생들의 이메일, 닉네임 등 개인정보 출력

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_email);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String w_seq  = rs.getString(1);
				String a_name = rs.getString(2);
				String a_city = rs.getString(3);
				String a_address = rs.getString(4);
				String a_tel = rs.getString(5);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
