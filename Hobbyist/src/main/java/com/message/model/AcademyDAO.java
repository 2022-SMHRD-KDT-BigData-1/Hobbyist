package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcademyDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	
	// 수강정보 / 수강내역 / 위시리스트
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
	// 수강정보 / 수강내역 / 위시리스트
	public ArrayList<MemberDTO> A_memberSelectAll(String a_id) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		connect();
		try {

			String sql = "select m_email, m_nick, m_age, m_tel from member where a_id=?";
			// 학원 id가 ?인 학생들의 이메일, 닉네임 등 개인정보 출력

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, a_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String m_email = rs.getString(1);
				String m_nick = rs.getString(2);
				String m_age = rs.getString(3);
				String m_tel = rs.getString(4);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	
	
	
}
