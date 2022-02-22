package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommunityDAO {
	// ��ȸ, �ۼ�, ����, �����ڿ�(��ü����), ������Ʈ
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	// �������� / �������� / ���ø���Ʈ
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_5_0115";
			String password = "smhrd5";

			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ���� ���� ���
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

	// Ŀ�´�Ƽ �� ���
	public ArrayList<CommunityDTO> commSelect() {

		ArrayList<CommunityDTO> list = new ArrayList<CommunityDTO>();

		connect();

<<<<<<< HEAD
		sql = "select c_seq, c_title, c_writer, c_view, c_content from community where c_email";
=======
		/*
		 * sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date" +
		 * " from community" + " order by c_seq desc";
		 */
		
		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date from community order by c_seq desc";
				
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/Hobbyist.git

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new CommunityDTO(rs.getInt(1), rs.getString(2), rs.getString(3), null, rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
<<<<<<< HEAD
=======
	
	
	//������ ó�� �޼ҵ�
//	public boolean nextPage(int pageNumber) {
//		String sql = "select * from community where c_ceq < ? and bbsAvailable = 1";
//		try {
//			PreparedStatement psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = psmt.executeQuery();
//			
//			if(rs.next()) {
//				return true;
//			}
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	
	

	// �Խ��� �Խñ� �������� �Խñ� �����ִ� �޼ҵ�
	public CommunityDTO commOneSelect(int seq) {
		connect();
		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date from community where c_seq=?";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();

			if (rs.next()) {
				CommunityDTO community = new CommunityDTO();
				community.setC_seq(rs.getInt(1));
				community.setM_nick(rs.getString(2));
				community.setC_title(rs.getString(3));
				community.setC_content(rs.getString(4));
				community.setC_pw(rs.getString(5));
				community.setC_view(rs.getInt(6));
				community.setC_date(rs.getString(7));
				return community;
			} else {
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

//	public ArrayList<Integer> commOneSelect() {
//
//		ArrayList<Integer> seq = new ArrayList<Integer>();
//		
//		connect();
//
//		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date"
//				+ " from community"
//				+ " order by c_seq desc";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//
//			rs = psmt.executeQuery();
//
//			while(rs.next()) {
//				seq.add(rs.getInt(1));
//			}
//			
//			
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return seq;
//	}
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/Hobbyist.git

	// Ŀ�´�Ƽ �� ����
	public int commUpload(CommunityDTO message) {

		connect();

		sql = "insert into community values(?,?,?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, message.getC_seq());
			psmt.setString(2, message.getC_writer());
			psmt.setString(3, message.getC_title());
			psmt.setString(4, message.getC_content());
			psmt.setString(5, message.getC_date());
			psmt.setInt(6, 1);
			

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return -1;

	}

	// Ŀ�´�Ƽ �� ����
	public int commUpdate(CommunityDTO communityDTO) {

		connect();

		sql = "update community set c_title=?, c_content=? where c_writer=? and c_pw=? ";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, communityDTO.getC_title());
			psmt.setString(2, communityDTO.getC_content());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cnt;

	}

	// Ŀ�´�Ƽ �� ����
	public int commDelete(String email, String pw) {

		connect();

		sql = "delete from community where c_writer=? and c_pw=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

}
