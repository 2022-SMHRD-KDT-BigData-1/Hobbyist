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
			
			sql="insert into review values(Seq.NEXTVAL,?,?,?,?,?,sysdate,?)";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, review.getRe_nick());
				psmt.setString(2, review.getRe_classname());
				psmt.setString(3, review.getRe_pw()); 
				psmt.setString(4, review.getRe_content()); 
				psmt.setInt(5, review.getRe_score()); 
				psmt.setString(6, review.getRe_id()); 
		
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
	}
		public int revDelete(ReviewDTO review) {
			connect();
			
			sql="delete from review where re_nick=? and re_pw=? and re_id = ?";
			
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, review.getRe_nick());
				psmt.setString(2, review.getRe_pw());
				psmt.setString(3, review.getRe_id());
				
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
			
			sql="update review set re_content=?, re_date = sysdate, re_score=? where re_nick=? and re_pw=? and re_id";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, reviewDTO.getRe_content());
				psmt.setInt(2, reviewDTO.getRe_score());
				psmt.setString(3, reviewDTO.getRe_pw());
				psmt.setString(4, reviewDTO.getRe_nick());
				psmt.setString(5, reviewDTO.getRe_id());
				
				
				cnt=psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			
			return cnt;
		}
		

		public ArrayList<ReviewDTO> reviewSelect(ArrayList<AcademyDTO> score) {
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
				System.out.println("select");
			for(int i = 0 ; i < score.size(); i++) {
			connect();
			
			sql="select * from review where re_id = ?";
			
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, score.get(i).getA_id());
				rs=psmt.executeQuery();
				while(rs.next()) {
					list.add(new ReviewDTO (rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			}
			return list;
		}
		
		public ArrayList<Double> avgScore(ArrayList<AcademyDTO> score) {
			ArrayList<Double> scoreAVG = new ArrayList<Double>();
			System.out.println("avg");
			for(int i = 0 ; i < score.size(); i++) {
			connect(); 
			
			sql="select round(avg(re_score),1) from review where re_id = ?";
			
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, score.get(i).getA_id());
				rs=psmt.executeQuery();
				
				if(rs.next()) {
					scoreAVG.add(rs.getDouble(1));
				}else {
					scoreAVG.add(null);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			}
			return scoreAVG;
		}
}
