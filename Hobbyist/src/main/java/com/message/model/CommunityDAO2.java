package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class CommunityDAO2 {
	// 조회, 작성, 삭제, 관리자용(전체삭제), 업데이트
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	
	// 싱글톤
//	private static CommunityDAO instance = new CommunityDAO();
//	private CommunityDAO() {}
//	public static CommunityDAO getInstance() {
//		return instance;
//	}

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

	// 리스트페이지에 보여줄 로직
	public ArrayList<CommunityDTO2> getList() {
		String sql = "select * from community order by no desc";
		ArrayList<CommunityDTO2> list = null;
		connect(); // 커넥션을 얻어옴

		try {
			psmt = conn.prepareStatement(sql); // sql 정의
			rs = psmt.executeQuery(); // sql 실행
			if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
				list = new ArrayList<>(); // list 객체 생성
				do {
					// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
					CommunityDTO2 board = new CommunityDTO2();
					board.setNo(rs.getInt("no"));
					board.setM_nick(rs.getString("nick"));
					board.setC_pw(rs.getString("pw"));
					board.setC_title(rs.getString("title"));
					board.setC_content(rs.getString("content"));
					board.setC_date(rs.getTimestamp("date"));
					board.setC_readCount(rs.getInt("readcount"));
					board.setIp(rs.getString("ip"));
					list.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(); // DB 연결 종료 / Connection 반환
		}
		return list; // list 반환
	}

	// insert 로직
	public int insertDB(CommunityDTO2 board, String nick, String pw, String title, String content, SimpleDateFormat df, int i, String ip) {
		String sql = "insert into community values(c_seq.nextval,?,?,?,?,sysdate,0,?)";
		connect();
		try {

			psmt = conn.prepareStatement(sql);
			// 물음표에 매개변수로 전달된 데이터 매핑
			psmt.setString(1, board.getM_nick());
			psmt.setString(2, board.getC_pw());
			psmt.setString(3, board.getC_title());
			psmt.setString(4, board.getC_content());
			psmt.setString(5, board.getIp());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	

//	// 커뮤니티 글 목록 전체조회
//	public ArrayList<CommunityDTO> commSelect() {
//
//		ArrayList<CommunityDTO> list = new ArrayList<CommunityDTO>();
//
//		connect();
//
//		/*
//		 * sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date" +
//		 * " from community" + " order by c_seq desc";
//		 */
//		
//		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date from community order by c_seq desc";
//				
//
//		try {
//			psmt = conn.prepareStatement(sql);
//
//			rs = psmt.executeQuery();
//
//			while (rs.next()) {
//				list.add(new CommunityDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
//						rs.getString(5), rs.getInt(6), rs.getString(7)));
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return list;
//	}
//	
//	
//	//페이지 처리 메소드
////	public boolean nextPage(int pageNumber) {
////		String sql = "select * from community where c_ceq < ? and bbsAvailable = 1";
////		try {
////			PreparedStatement psmt = conn.prepareStatement(sql);
////			psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
////			rs = psmt.executeQuery();
////			
////			if(rs.next()) {
////				return true;
////			}
////			
////		}catch (Exception e) {
////			e.printStackTrace();
////		}
////		return false;
////	}
//	
//	
//	
//
//	// 게시판 게시글 눌렀을때 게시글 보여주는 메소드
//	public CommunityDTO commOneSelect(int seq) {
//		connect();
//		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date from community where c_seq=?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			
//			psmt.setInt(1, seq);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				CommunityDTO community = new CommunityDTO();
//				community.setC_seq(rs.getInt(1));
//				community.setM_nick(rs.getString(2));
//				community.setC_title(rs.getString(3));
//				community.setC_content(rs.getString(4));
//				community.setC_pw(rs.getString(5));
//				community.setC_view(rs.getInt(6));
//				community.setC_date(rs.getString(7));
//				return community;
//			} else {
//				
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return null;
//	}
//
////	public ArrayList<Integer> commOneSelect() {
////
////		ArrayList<Integer> seq = new ArrayList<Integer>();
////		
////		connect();
////
////		sql = "select c_seq, m_nick, c_title, c_content, c_pw, c_view, c_date"
////				+ " from community"
////				+ " order by c_seq desc";
////
////		try {
////			psmt = conn.prepareStatement(sql);
////
////			rs = psmt.executeQuery();
////
////			while(rs.next()) {
////				seq.add(rs.getInt(1));
////			}
////			
////			
////
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			close();
////		}
////		return seq;
////	}
//
//	// 커뮤니티 글 쓰기
//	public int commUpload(CommunityDTO board) {
//
//		connect();
//		sql = "insert into community values(c_seq.nextval,?,?,?,sysdate,?,0)";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//
//			psmt.setString(1, board.getM_nick());
//			psmt.setString(2, board.getC_title());
//			psmt.setString(3, board.getC_content());
//			psmt.setString(4, board.getC_pw());
//
//			cnt = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return cnt;
//	}
//
//	// 커뮤니티 글 수정
//	public int commUpdate(CommunityDTO board, MemberDTO nick) {
//
//		connect();
//
//		sql = "update community set c_title=?, c_content=? where m_nick=? and c_pw=?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//
//			psmt.setString(1, board.getC_title());
//			psmt.setString(2, board.getC_content());
//			psmt.setString(3, nick.getM_nick());
//			psmt.setString(4, board.getC_pw());
//
//			cnt = psmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return cnt;
//	}
//
//	// 커뮤니티 글 삭제
//	public int commDelete(String nick, String pw) {
//
//		connect();
//
//		sql = "delete from community where m_nick=? and c_pw=?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, nick);
//			psmt.setString(2, pw);
//
//			cnt = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return cnt;
//
//	}

}
