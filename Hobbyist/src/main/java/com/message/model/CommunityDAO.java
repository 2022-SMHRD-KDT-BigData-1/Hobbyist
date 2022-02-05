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

		sql = "select c_seq, c_title, c_writer, c_view, c_content from community where c_email";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new CommunityDTO(rs.getInt(1), rs.getString(2), rs.getString(3), null, rs.getString(4),
						rs.getString(5), rs.getString(6)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// Ŀ�´�Ƽ �� ����
	public int commUpload(CommunityDTO message) {

		connect();

		sql = "insert into community values(?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, message.getC_title());
			psmt.setString(2, message.getC_content());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

	// Ŀ�´�Ƽ �� ����
	public int commUpdate(CommunityDTO communityDTO) {

		connect();

		sql = "update community set c_title=?, c_content=?, where c_writer=? and c_pw=? ";

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
