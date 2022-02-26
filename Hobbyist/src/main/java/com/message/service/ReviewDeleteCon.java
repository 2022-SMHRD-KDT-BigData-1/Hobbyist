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

@WebServlet("/ReviewDeleteCon")
public class ReviewDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String re_nick = request.getParameter("rev_nick");  
		String re_pw = request.getParameter("revPass");  
		
		if (re_pw == null) {
			out.print("<script>");
			out.print("alert('비밀번호를 확인해주세요');");
			out.print("location.href='Recommend.jsp';"); 
			out.print("</script>");
		}
		String re_id = request.getParameter("rev_id");  
		
		ReviewDTO review = new ReviewDTO(0, re_nick, re_id, null, re_pw, 0, null, null);
		ReviewDAO dao = new ReviewDAO();
		
		int cnt =  dao.revDelete(review);
		if(cnt >0) {
			System.out.println("리뷰삭제완료");
			out.print("<script>");
			out.print("alert('리뷰삭제성공');");
			out.print("</script>");
			if(session.getAttribute("Review") != null) {
				ArrayList <ReviewDTO> Review = (ArrayList <ReviewDTO>) session.getAttribute("Review");
				session.removeAttribute("Review");
				for(int i = 0; i < Review.size(); i++) {
					if(Review.get(i).getRe_id().equals(review.getRe_id()) && Review.get(i).getRe_nick().equals(review.getRe_nick()) && Review.get(i).getRe_pw().equals(review.getRe_pw())) {
						Review.remove(i);
					}
				}
				session.setAttribute("Review", Review);
					}
			String pageNum = (String) session.getAttribute("pageNum");
			response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
				}
		else {
			System.out.println("리뷰삭제실패");
			out.print("<script>");
			out.print("alert('비밀번호를 확인해주세요');");
			out.print("location.href='Recommend.jsp';"); 
			out.print("</script>");
		}
	}

}
