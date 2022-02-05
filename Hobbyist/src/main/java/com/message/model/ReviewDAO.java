package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {
	//revUpload(작성), revDelete(삭제), revSelect(조회), revUpdate(수정) 
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
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
		public int revUpload(ReviewDTO review) {
			connect();
			
			sql="insert into review values(?,?,?,?,?,?)";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, review.getR_nick());
				psmt.setString(2, review.getR_name());
				psmt.setString(3, review.getR_pw()); 
				psmt.setString(4, review.getR_content()); 
				psmt.setString(5, review.getR_date()); 
				psmt.setInt(6, review.getR_score()); 
		
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
	}
		public int revDelete(String r_nick, String r_pw) {
			connect();
<<<<<<< HEAD
			sql="delete from review where r_nick=? and r_pw=?";
=======
			
			sql="delete r_pw, r_nick, r_name, r_content, r_date, r_score from review where r_nick=? and r_pw=?";
			
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/RealHobbyist.git
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, r_nick);
				psmt.setString(2, r_pw);
				
				cnt=psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
		}
		public int revUpdate(ReviewDTO reviewDTO) {
			
			connect();
			
			sql="update review set r_pw=?, r_nick=?, r_name=?, r_content=?, r_date=?, r_score=? where r_nick=? and r_pw=?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, reviewDTO.getR_pw());
				psmt.setString(2, reviewDTO.getR_nick());
				psmt.setString(3, reviewDTO.getR_name());
				psmt.setString(4, reviewDTO.getR_content());
				psmt.setString(5, reviewDTO.getR_date());
				psmt.setInt(6, reviewDTO.getR_score());
				
				
				cnt=psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			
			return cnt;
		}
		public ArrayList<ReviewDTO> revSelect() {
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			connect();
			
			sql="select r_num, r_nick, r_name, r_pw, r_content, r_score, r_date from review ";
			
			try {
				psmt=conn.prepareStatement(sql);
			
				
				rs=psmt.executeQuery();
				
				
				while(rs.next()) {
			
					list.add(new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return list;
		}

}
