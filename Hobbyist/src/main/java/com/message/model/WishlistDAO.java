package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WishlistDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	// connect는 DB연결기능을 하는 메소드
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

	public int wishCreate(WishlistDTO wishCreate) {

		connect();
		sql = "insert into wishlist values(num_seq.nextval, 1, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, wishCreate.getW_email());
			psmt.setString(2, wishCreate.getAc_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

	public ArrayList<WishlistDTO> select() { // 보류
		ArrayList<WishlistDTO> list = new ArrayList<WishlistDTO>();

		connect();
		sql = "select * from addr where a_L_category = ? and a_m_category = ? and a_city = ?";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new WishlistDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public ArrayList<WishlistDTO> recoWishSelect(ArrayList<AddrDTO> wish, String email) {
		ArrayList<WishlistDTO> list = new ArrayList<WishlistDTO>();

		connect();

		sql = "select * from wishlist where ac_id = ? and w_email = ?";

		try {
			for (int i = 0; i < wish.size(); i++) {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, wish.get(i).getAc_id());
				psmt.setString(2, email);
				rs = psmt.executeQuery();

				if (rs.next()) {
					list.add(new WishlistDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
				} else {
					list.add(null);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
//	public ArrayList<WishlistDTO> recoWishSelect(ArrayList<AcademyDTO> wish, String email) {
//		ArrayList<WishlistDTO> list = new ArrayList<WishlistDTO>();
//		
//		connect();
//		
//		sql = "select * from wishlist where a_id = ? and w_email = ?";
//		
//		try {
//			for (int i = 0; i < wish.size(); i++) {
//				psmt = conn.prepareStatement(sql);
//				psmt.setString(1, wish.get(i).getA_id());
//				psmt.setString(2, email);
//				rs = psmt.executeQuery();
//				
//				if (rs.next()) {
//					list.add(new WishlistDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
//				} else {
//					list.add(null);
//				}
//				
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return list;
//	}

	public ArrayList<AddrDTO> WishSelect(String email) {
		ArrayList<AddrDTO> list = new ArrayList<AddrDTO>();
		connect();

		sql = "select * from wishlist w, addr a where w.ac_id = a.ac_id and w_wish = 1 and w_email = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new AddrDTO(rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public ArrayList<WishlistDTO> WishSelect2(String email) {
		ArrayList<WishlistDTO> list = new ArrayList<WishlistDTO>();
		connect();
		
		sql = "select * from wishlist w, addr a where w.ac_id = a.ac_id and w_wish = 1 and w_email = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				list.add(new WishlistDTO(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int wishDelete(WishlistDTO wishDelete) {
		connect();
		sql = "delete from wishlist where w_email = ? and ac_id = ?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, wishDelete.getW_email());
			psmt.setString(2, wishDelete.getAc_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
}
