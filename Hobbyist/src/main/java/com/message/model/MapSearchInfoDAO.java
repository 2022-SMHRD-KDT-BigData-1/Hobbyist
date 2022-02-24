package com.message.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MapSearchInfoDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	public MapSearchInfoDAO() {
		
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
	
	public ArrayList<MapSearchInfoDTO> search(String Academy){
		
		String sql = "select * from map_info where Academy like ?";
		ArrayList<MapSearchInfoDTO> mapList = new ArrayList<MapSearchInfoDTO>();
		try {
			psmt = conn.prepareStatement(sql);
			String Academys = '%'+Academy+'%';
			psmt.setString(1, Academys);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MapSearchInfoDTO maplist = new MapSearchInfoDTO();
				maplist.setCategory(rs.getString(1));
				maplist.setAcademy(rs.getString(2));
				maplist.setLocation(rs.getString(3));
				maplist.setTel(rs.getString(4));
				mapList.add(maplist);
			}
		} catch(Exception e) {
			
		}
		return mapList;
	}


}
