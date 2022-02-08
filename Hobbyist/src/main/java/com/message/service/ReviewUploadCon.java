package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;

@WebServlet("/ReviewUploadCon")
public class ReviewUploadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String re_nick = request.getParameter("re_nick");  
		String re_classname = request.getParameter("re_classname");  
		String re_pw = request.getParameter("re_pw");  
		String re_content = request.getParameter("re_content");  
		int re_score = Integer.parseInt(request.getParameter("re_score"));  
		String re_id = request.getParameter("re_id");  
		
		Integer int_null = null;
		ReviewDTO review = new ReviewDTO(int_null, re_nick, re_classname, re_pw, re_content, re_score, null, re_id);
		ReviewDAO dao = new ReviewDAO();
		
		int cnt =  dao.revUpload(review);
		if(cnt >0) {
			System.out.println("리뷰작성완료");
			response.sendRedirect("리뷰작성후 돌아갈 페이지"); // 차후 수정 
		}else {
			System.out.println("리뷰작성실패");
			out.print("<script>");
			out.print("alert('리뷰작성실패');");
			out.print("location.href='돌아갈페이지';"); //차후 수정 
			out.print("</script>");
		}
	}

}
