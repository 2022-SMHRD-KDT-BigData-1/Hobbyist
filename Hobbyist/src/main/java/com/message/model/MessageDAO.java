package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";

			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int sendMessage(MessageDTO messageDTO) {
		connect();
		
		sql="insert into web_message values(num_seq.nextval,?,?,?,sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			
			psmt.setString(1, messageDTO.getM_sendName());
			psmt.setString(2, messageDTO.getM_receiveEmail()); 
			psmt.setString(3, messageDTO.getM_content());
			
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public ArrayList<MessageDTO> messageSelect(String email) {
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		
		connect();
		
		sql="select m_num, m_sendName,m_content,m_sendDate from web_message where m_receiveEmail=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs=psmt.executeQuery();
			
			
			while(rs.next()) {
				/*
				 * int m_num=rs.getInt(1);
				 * String m_sendName = rs.getString(2);
				 * String m_content = rs.getString(3);
				 * String m_sendDate = rs.getString(4);
				 * 의 과정을 객체에다가 한번에 넣는 방법
				 * */
				list.add(new MessageDTO(rs.getInt(1), rs.getString(2), null, rs.getString(3), rs.getString(4)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

	public int messageDelete(String email, String num) {
		connect();
		
		sql="delete from web_message where m_receiveEmail=? and m_num=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, num);
			
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	public int messageDeleteAll(String m_email) {
		connect();
		
		sql="delete from web_message where m_receiveEmail=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, m_email);
			
			
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
}
