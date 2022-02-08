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

		sql = "select C.c_seq, M.m_nick, C.c_title, C.c_content, C.c_view, C.c_date"
				+ "from community inner join member"
				+ "on M.m_nick = C.m_nick"
				+ "order by c_seq(desc)";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new CommunityDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null,
						rs.getInt(5), rs.getString(6)));
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// Ŀ�´�Ƽ �� ����
	public int commUpload(CommunityDTO board, MemberDTO member) {

		connect();

		sql = "insert into community values(num_seq.nextval,?,?,?,0,sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getM_nick());
			psmt.setString(2, board.getC_title());
			psmt.setString(3, board.getC_content());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

	// Ŀ�´�Ƽ �� ����
	public int commUpdate(CommunityDTO board, MemberDTO nick) {

		connect();

		sql = "update community set c_title=?, c_content=? where m_nick=? and c_pw=?";

		try {
			psmt = conn.prepareStatement(sql);
			
			
			psmt.setString(1, board.getC_title());
			psmt.setString(2, board.getC_content());
			psmt.setString(3, nick.getM_nick());
			psmt.setString(4, board.getC_pw());


			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	

	// Ŀ�´�Ƽ �� ����
	public int commDelete(String nick, String pw) {

		connect();

		sql = "delete from community where m_nick=? and c_pw=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
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
