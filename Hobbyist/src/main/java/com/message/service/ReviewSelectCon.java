package com.message.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.message.model.AcademyDTO;
import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;

@WebServlet("/ReviewCon")
public class ReviewSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String re_id = request.getParameter("re_id"); // << 인풋으로 가져온다면 
		
		/* HttpSession session = request.getSession();
		AcademyDTO academy = (AcademyDTO) session.getAttribute("academy"); // 세션으로 가져온다면
		*/
		Integer int_null = null;
		ReviewDTO review = new ReviewDTO(int_null,null,null,null,null,int_null,null,re_id);
		ReviewDAO dao = new ReviewDAO();
		
		ArrayList<ReviewDTO> reviews =  dao.revSelect(review);
		request.setAttribute("reviewSelect", reviews);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("리뷰페이지.jsp"); // < 차후 수정 
		dispatcher.forward(request, response);
		
		
	}

}
