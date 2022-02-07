package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;

@WebServlet("/ReviewCon")
public class ReviewSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String a_classname = request.getParameter("a_classname"); // << 차후 수정 
		
		
		ReviewDAO dao = new ReviewDAO();
		
		ArrayList<ReviewDTO> reviews =  dao.revSelect(a_classname);
		request.setAttribute("review", reviews);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("리뷰페이지.jsp"); // < 차후 수정 
		dispatcher.forward(request, response);
		
		
		
		
	}

}
