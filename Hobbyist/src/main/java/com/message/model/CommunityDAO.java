package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommunityDAO {
	// 조회, 작성, 삭제, 관리자용(전체삭제), 업데이트
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	// 수강정보 / 수강내역 / 위시리스트
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

	// 연결 종료 기능
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

	// 커뮤니티 글 목록
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

	// 커뮤니티 글 쓰기
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

	// 커뮤니티 글 수정
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
	
	

	// 커뮤니티 글 삭제
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
