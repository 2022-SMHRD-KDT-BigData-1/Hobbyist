package com.message.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MapInfoDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	public MapInfoDAO() {
		
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user="campus_f_5_0115";
			String password="smhrd5";
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MapInfoDTO> search(String Academy){
		
		String sql = "select ac_id, ac_name, ac_addr, ac_rel from ADDR where ac_addr like ? or ac_addr like ? or ac_addr like?";
		ArrayList<MapInfoDTO> mapList = new ArrayList<MapInfoDTO>();
		try {
			psmt = conn.prepareStatement(sql);
			String Academys = '%'+Academy+'%';
			String Academys2 = '%'+Academy;
			String Academys3 = Academy+'%';
			psmt.setString(1, Academys);
			psmt.setString(2, Academys2);
			psmt.setString(3, Academys3);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MapInfoDTO maplist = new MapInfoDTO();
				maplist.setAc_category(rs.getString(1));
				maplist.setAc_id(rs.getString(2));
				maplist.setAc_name(rs.getString(3));
				maplist.setAc_rel(rs.getString(4));
				mapList.add(maplist);
			}
		} catch(Exception e) {
			
		}
		return mapList;
	}


}
