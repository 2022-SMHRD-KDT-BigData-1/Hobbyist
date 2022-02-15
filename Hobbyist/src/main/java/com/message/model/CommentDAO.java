package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
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

	// 댓글 전체 조회
	public ArrayList<CommentDTO> commentSelect() {

		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		connect();

		sql = "select * from \"comment\" order by com_seq desc";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new CommentDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 댓글 추가
	public int commentUpload(CommentDTO comment, CommunityDTO board, MemberDTO member) {

		connect();

		sql = "insert into comment values(num_seq.nextval,?,?,?,?,sysdate)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, board.getC_seq());
			psmt.setString(2, member.getM_nick());
			psmt.setString(3, comment.getCom_content());
			psmt.setString(4, comment.getCom_pw());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}
	
	
	// 댓글 수정
	public int commentUpdate(CommentDTO comment, CommunityDTO board, MemberDTO nick) {

		connect();

		sql = "update comment set com_content=?, where c_seq=? and m_nick=? and c_pw=?";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, comment.getCom_content());
			psmt.setInt(2, board.getC_seq());
			psmt.setString(3, nick.getM_nick());
			psmt.setString(4, comment.getCom_pw());
			

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	//댓글 삭제
	public int commentDelete(String nick, String pw) {

		connect();

		sql = "delete from comment where m_nick=? and com_pw=?";

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
