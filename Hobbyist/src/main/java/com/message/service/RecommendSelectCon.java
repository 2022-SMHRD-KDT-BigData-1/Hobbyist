package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.RecommendDAO;
import com.message.model.RecommendDTO;

@WebServlet("/RecommendSelectCon")
public class RecommendSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String a_L_category = request.getParameter("a_L_category"); 
		String a_m_category = request.getParameter("a_m_category"); 
		String a_city = request.getParameter("a_city"); 
		
		Integer int_null = null;
		RecommendDTO Recommend = new RecommendDTO(null,null,null,null, a_L_category, a_m_category, a_city);
		RecommendDAO dao = new RecommendDAO();
		
		ArrayList<RecommendDTO> recommend =  dao.recSelect(Recommend);
		request.setAttribute("recommend", recommend);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("��õ������.jsp"); // < ���� ���� 
		dispatcher.forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
	}

}