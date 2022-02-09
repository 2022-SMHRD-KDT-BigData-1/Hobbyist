package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecommendDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_5_0115";
	        String password = "smhrd5";
			
			conn= DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
	}
	
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
	
	public ArrayList<RecommendDTO>recSelect(RecommendDTO Recommend) {
		ArrayList<RecommendDTO> list = new ArrayList<RecommendDTO>();
		
		connect();
		
		sql="select * from Recommend where a_L_category = ? and a_m_category = ? and a_city = ?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, Recommend.getA_L_category());
			psmt.setString(2, Recommend.getA_m_category());
			psmt.setString(3, Recommend.getA_city());
			
			rs=psmt.executeQuery();
			
			
			while(rs.next()) {
				list.add(new RecommendDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
}
