package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.CommunityDAO;
import com.message.model.CommunityDTO;

@WebServlet("/CommunityCon")
public class CommunitySelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
		
		CommunityDAO dao = new CommunityDAO();
		
		
		
		ArrayList<CommunityDTO> list=  dao.commSelect();
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("community.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
