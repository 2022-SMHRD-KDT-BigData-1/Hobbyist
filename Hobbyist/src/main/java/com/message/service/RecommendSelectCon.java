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

import com.message.model.AcademyDTO;
import com.message.model.RecommendDAO;
import com.message.model.RecommendDTO;
import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;

@WebServlet("/RecommendSelectCon")
public class RecommendSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("recommend") != null) {
			session.removeAttribute("recommend");
			session.removeAttribute("count");
			session.removeAttribute("scoreAvg");
		}
		
		
		request.setCharacterEncoding("utf-8");
		String a_L_category = request.getParameter("a_L_category1"); 
		String a_m_category = request.getParameter("a_m_category1"); 
		String a_city = request.getParameter("city"); 
		
		AcademyDTO Recommend = new AcademyDTO(null,null,null,a_L_category, a_m_category, null, a_city);
		RecommendDAO dao = new RecommendDAO();
		ReviewDAO dao2 = new ReviewDAO();
		
		
		
		ArrayList<AcademyDTO> recommend =  dao.recSelect(Recommend);
		ArrayList<Double> scoreAvg = dao2.avgScore(recommend);
		
		int count = 0;
		count = dao.getCount(Recommend);  
		System.out.println(count);
		
		
		
		session.setAttribute("recommend", recommend);
		session.setAttribute("count", count);
		session.setAttribute("scoreAvg", scoreAvg);
		
		response.sendRedirect("Recommend.jsp");
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
