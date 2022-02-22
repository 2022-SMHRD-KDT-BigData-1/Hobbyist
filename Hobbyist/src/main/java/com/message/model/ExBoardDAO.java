package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ExBoardDAO {
	private Connection conn;
	private PreparedStatement ppst;
	private ResultSet rs;

	// �̱���
	private static ExBoardDAO instance = new ExBoardDAO();

	private ExBoardDAO() {
	}

	public static ExBoardDAO getInstance() {
		return instance;
	}

	// Ŀ�ؼ� Ǯ �̿�
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

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

	// �����ͺ��̽� ���� ����
	private void quitDB() {
		try {
			if (rs != null)
				rs.close();
			if (ppst != null)
				ppst.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// ����Ʈ �������� ������ ����(����¡ ó��)
	public List<ExBoardDTO> getList(int startRow, int endRow) {
		// ����¡ ó���� ���� sql / �ζ��κ�, rownum ���
		String sql = "select * from "
				+ "(select rownum rn, no, name, passwd, subject, content, reg_date, readcount, ip from "
				+ "(select * from exboard order by no desc)) where rn between ? and ?";
		List<ExBoardDTO> list = null;
		try {
			connect(); // Ŀ�ؼ��� ����
			ppst = conn.prepareStatement(sql); // sql ����
			ppst.setInt(1, startRow); // sql ����ǥ�� �� ����
			ppst.setInt(2, endRow);
			rs = ppst.executeQuery(); // sql ����
			if (rs.next()) { // �����ͺ��̽��� �����Ͱ� ������ ����
				list = new ArrayList<>(); // list ��ü ����
				do {
					// �ݺ��� ������ ExboardDTO ��ü�� ���� �� ������ ����
					ExBoardDTO board = new ExBoardDTO();
					board.setNo(rs.getInt("no"));
					board.setName(rs.getString("name"));
					board.setPasswd(rs.getString("passwd"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setReg_date(rs.getTimestamp("reg_date"));
					board.setReadCount(rs.getInt("readcount"));
					board.setIp(rs.getString("ip"));

					list.add(board); // list�� 0�� �ε������� board ��ü�� �������� ����
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB ���� ���� / Connection ��ȯ
		}
		return list; // list ��ȯ
	}

	// �� ���ڵ� �� ���ϴ� ����
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from exboard";
		try {
			connect();
			ppst = conn.prepareStatement(sql);
			rs = ppst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return count; // �� ���ڵ� �� ����
	}

	// insert ����
	public void insertDB(ExBoardDTO board) {
		String sql = "insert into exboard values(seq_exboard.nextval,?,?,?,?,sysdate,0,?)";
		try {
			// = getConnection();
			connect();
			ppst = conn.prepareStatement(sql);
			// ����ǥ�� �Ű������� ���޵� ������ ����
			ppst.setString(1, board.getName());
			ppst.setString(2, board.getPasswd());
			ppst.setString(3, board.getSubject());
			ppst.setString(4, board.getContent());
			ppst.setString(5, board.getIp());
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// ������ Ŭ���Ͽ��� �� ��ȸ�� ����
	public void readCount(int no) {
		String sql = "update exboard set readcount = readcount + 1 where no = " + no;
		try {
			connect();
			ppst = conn.prepareStatement(sql);
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// ������ Ŭ���Ͽ��� �� Ư�� �׸��� �˻��� ����
	public ExBoardDTO getBoard(int no) {
		String sql = "select * from exboard where no = ?";
		ExBoardDTO board = null;
		try {
			connect();
			ppst = conn.prepareStatement(sql);
			ppst.setInt(1, no);
			rs = ppst.executeQuery();
			if (rs.next()) {
				board = new ExBoardDTO();
				board.setNo(rs.getInt("no"));
				board.setName(rs.getString("name"));
				board.setPasswd(rs.getString("passwd"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadCount(rs.getInt("readcount"));
				board.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return board;
	}

	// update ����
	public void updateDB(ExBoardDTO board) {
		String sql = "update exboard set name = ?, subject = ?, content = ? where no = ?";
		try {
			connect();
			ppst = conn.prepareStatement(sql);
			ppst.setString(1, board.getName());
			ppst.setString(2, board.getSubject());
			ppst.setString(3, board.getContent());
			ppst.setInt(4, board.getNo());
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// �ش� ������ ����
	public void deleteDB(int no) {
		String sql = "delete from exboard where no = " + no;
		try {
			connect();
			ppst = conn.prepareStatement(sql);
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}
}
