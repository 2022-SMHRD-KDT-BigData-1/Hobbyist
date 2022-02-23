package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.AcademyDTO;
import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;
import com.message.model.WishlistDTO;

@WebServlet("/ReviewWriteCon")
public class ReviewWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String re_nick = request.getParameter("nick");  
		System.out.println(re_nick + " jsp -> con �г��� ����");
		String re_classname = request.getParameter("classname");
		System.out.println(re_classname + " jsp -> con �г��� ����");
		String re_pw = request.getParameter("passwd");  
		String re_content = request.getParameter("content");  
		int re_score = Integer.parseInt(request.getParameter("score"));  
		String re_id = request.getParameter("re_id");  
		
		ReviewDTO review = new ReviewDTO(0, re_nick, re_id, re_classname, re_pw, re_score, re_content, null); 
		ReviewDAO dao = new ReviewDAO();
		
		int cnt =  dao.revUpload(review);
		if(cnt >0) {
			System.out.println("�����ۼ��Ϸ�");
			out.print("<script>");
			out.print("alert('�����ۼ�����');");
			if(session.getAttribute("Review") != null) {
				ArrayList <ReviewDTO> Review = (ArrayList <ReviewDTO>) session.getAttribute("Review");
				session.removeAttribute("Review");
				ArrayList <AcademyDTO> recommend = (ArrayList<AcademyDTO>) session.getAttribute("recommend");
				Review.add(review);
				session.setAttribute("Review", Review);
					}
			String pageNum = (String) session.getAttribute("pageNum");
			response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
				}
		else {
			System.out.println("�����ۼ�����");
			out.print("<script>");
			out.print("alert('�����ۼ�����');");
			out.print("location.href='Recommend.jsp';"); 
			out.print("</script>");
		}
		
		
		
		
		
		
		
		
		
	}

}
