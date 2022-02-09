package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	//DAO에는 필요한 필드들을 미리 선언
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
	//회원가입기능
	public int memberJoin(MemberDTO member) {
		connect();
		
		sql="insert into member values(?,?,?,?,?,?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getM_email());
			psmt.setString(2, member.getM_pw());
			psmt.setString(3, member.getM_name()); 
			psmt.setString(4, member.getM_nick());
			psmt.setString(5, member.getM_tel());
			psmt.setString(6, member.getM_address());
			psmt.setString(7, member.getM_age());
			psmt.setString(8, member.getM_gender());
			psmt.setString(9, null);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public MemberDTO memberLogin(String email, String pw) {
		connect();
		
		MemberDTO member = null;
		sql = "select m_nick from member where m_email = ? and m_pw = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {//rs.next는 회원가입된 정보가 DB에 있는지 확인
				
				member = new MemberDTO(email, pw, rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9));
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close();
		}
		return member;
	}

	public int memberUpdate(MemberDTO memberDTO) {
		
		connect();
		
		sql="update member set m_pw=?, m_nick=?, m_age=?, m_gender=?, m_tel=?, m_address=?, m_hashtag=?, m_a_id=? where m_email=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, memberDTO.getM_pw());
			psmt.setString(2, memberDTO.getM_name());
			psmt.setString(3, memberDTO.getM_nick());
			psmt.setString(4, memberDTO.getM_tel());
			psmt.setString(5, memberDTO.getM_address());
			psmt.setString(6, memberDTO.getM_age());
			psmt.setString(7, memberDTO.getM_gender());
			psmt.setString(8, memberDTO.getA_id());
			
			cnt=psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	// 수강정보 / 수강내역 / 위시리스트
	public ArrayList<AcademyDTO> classSelectAll() {
		ArrayList<AcademyDTO> list = new ArrayList<AcademyDTO>();
		connect();
		try {

			String sql = "select a_id, a_classname, a_tel, a_address "
					+ "from academy "
					+ "where ";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				//rs 객체 내에 저장된 회원정보들 접근 -> Member 객체 생성 -> list에 저장
				String a_id = rs.getString(1);
				String a_classname = rs.getString(2);
				String a_tel = rs.getString(3);
				String a_address = rs.getString(4);
				
				list.add(new AcademyDTO(a_id,a_classname, a_tel, a_address));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
