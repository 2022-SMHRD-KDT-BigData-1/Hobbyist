package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.MapInfoDAO;
import com.message.model.MapInfoDTO;


@WebServlet("/MapInfoListSearch")
public class MapInfoListSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String Academy = request.getParameter("Academy");
		response.getWriter().write(getJSON(Academy));
		
	}
	
	public String getJSON(String Academy) {
		
		if(Academy==null) Academy = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\result\":[");
		MapInfoDAO mapinfoDAO = new MapInfoDAO();
		ArrayList<MapInfoDTO> mapList = mapinfoDAO.search(Academy);
		
		for(int i=0;i<mapList.size();i++) {
			result.append("[{\"value\":\""+mapList.get(i).getAcademy()+"\"},");
			result.append("{\"value\":\""+mapList.get(i).getAcademy()+"\"},");
			result.append("{\"value\":\""+mapList.get(i).getAcademy()+"\"},");
			result.append("{\"value\":\""+mapList.get(i).getAcademy()+"\"}],");
		}
			result.append("]}");
			return result.toString();
	}
}
