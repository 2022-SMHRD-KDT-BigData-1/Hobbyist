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
			
			sql="insert into review (A_classname, Re_pw, Re_content, Re_date, Re_score)values(?,?,?,?,?)";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, review.getA_classname());
				psmt.setString(2, review.getRe_pw()); 
				psmt.setString(3, review.getRe_content()); 
				psmt.setString(4, review.getRe_date()); 
				psmt.setInt(5, review.getRe_score()); 
		
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
			
			sql="delete re_seq, re_pw, re_content, re_date, re_score from review where m_nick=? and r_pw=?";
			
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
			
			sql="update review set re_content=?, re_date=?, re_score=? where m_nick=? and re_pw=?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, reviewDTO.getRe_pw());
				psmt.setString(2, reviewDTO.getM_nick());
				
				
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
			
			sql="select m_nick, a_classname, re_content, re_score, re_date from review ";
			
			try {
				psmt=conn.prepareStatement(sql);
			
				
				rs=psmt.executeQuery();
				
				
				while(rs.next()) {
					int r = 0;
					list.add(new ReviewDTO(r, rs.getString(1), rs.getString(2), null, rs.getString(3), rs.getInt(4), rs.getString(5)));
					r++;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return list;
		}

}
