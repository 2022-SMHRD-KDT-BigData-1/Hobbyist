package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.message.model.MapInfoDAO;
import com.message.model.MapInfoDTO;
import com.message.model.MapSearchInfoDAO;
import com.message.model.MapSearchInfoDTO;


@WebServlet("/MapSearchInfo")
public class MapSearchInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String Academy = request.getParameter("Academy");
		
		System.out.println(Academy);
		
		MapSearchInfoDAO dao = new MapSearchInfoDAO();
		JsonArray jarray = new JsonArray();
		
		//JsonObject json = new JsonObject();
		
		ArrayList<MapSearchInfoDTO> list = dao.search(Academy);
		System.out.println(list.get(0).getAcademy());
		System.out.println(list.get(0).getCategory());
		System.out.println(list.get(0).getLocation());
		Gson gson = new Gson();
		
		
//		for(int i=0;i<list.size();i++) {
//			JsonObject json = new JsonObject();
//			json.addProperty("Category", list.get(i).getCategory());
//			json.addProperty("Academy", list.get(i).getAcademy());
//			json.addProperty("Location", list.get(i).getLocation());
//			json.addProperty("Tel", list.get(i).getTel());
//			jarray.add(json);
//		}
		
		for (int i=0;i<list.size();i++) {
			jarray.add(gson.toJson(list.get(i)));
			// Gson 객체를 사용하면 키 값을 자동으로 지정
			// 키값 --> 해당하는 변수명
			
		}
		//System.out.println(gson.toJson(list));
		response.getWriter().print(gson.toJson(list));
		
		
	}
	
	
}
