package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MarkerDAO;
import com.message.model.MarkerDTO;

@WebServlet("/MarkerCon")
public class MarkerCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	
	ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
	MarkerDAO dao = new MarkerDAO();
	locmarker = dao.marSelect(); 
	
	if(locmarker == null) {
		System.out.println(" 마커 불러오기 실패! ");
		
	}else {
		System.out.println(" 마커 불러오기 성공! ");
		System.out.println(locmarker.toString());
		session.setAttribute("locmarker", locmarker);
		response.sendRedirect("marker.jsp");
	}
	}

}
