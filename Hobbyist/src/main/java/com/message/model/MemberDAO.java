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
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user="hr";
			String password="hr";
			
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
		
		sql="insert into web_member values(?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getM_email());
			psmt.setString(2, member.getM_pw());
			psmt.setString(3, member.getM_tel()); 
			psmt.setString(4, member.getM_address());
			
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
		sql = "select m_tel, m_address from web_member where m_email = ? and m_pw = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {//rs.next는 회원가입된 정보가 DB에 있는지 확인
				
				member = new MemberDTO(email, pw, pw, pw, pw, pw, email, pw);
				//pw는 조회하지 않았기 때문에 null값을 넣어줌., tel, address는 sql문 실행해서 가져오는 것
				
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
		
		sql="update web_member set m_pw=?, m_tel=?, m_address=? where m_email=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, memberDTO.getM_pw());
			psmt.setString(2, memberDTO.getM_tel());
			psmt.setString(3, memberDTO.getM_address());
			psmt.setString(4, memberDTO.getM_email());
			
			cnt=psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	public ArrayList<MemberDTO> memberSelectAll() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		connect();
		try {

			String sql = "select m_email, m_tel, m_address from web_member";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				//rs 객체 내에 저장된 회원정보들 접근 -> Member 객체 생성 -> list에 저장
				String m_email = rs.getString(1);
				String m_tel = rs.getString(2);
				String m_address = rs.getString(3);
				if(!m_email.equals("admin")) {
					list.add(new MemberDTO(m_email, sql, m_email, m_tel, m_address, m_address, m_tel, m_address));
				}
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
