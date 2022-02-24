package com.message.model;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MarkerDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private String sql;
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user="campus_f_5_0115";
			String password="smhrd5";
			
			conn = DriverManager.getConnection(url, user, password);
		
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
		public ArrayList<MarkerDTO> marSelect(){
			connect();
			String sql = "select * from addr";
			ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
			try {
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();
				
				while (rs.next()) {
						locmarker.add(new MarkerDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)
							, rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12)));

				/*System.out.println("승호바보");*/}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close();
		}
	/*	System.out.println(locmarker.toString());
		System.out.println("대현이천재");*/
		return locmarker;
          
          
          }
		
	}

	

