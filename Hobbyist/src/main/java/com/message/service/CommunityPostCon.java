package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.CommunityDAO;
import com.message.model.CommunityDTO;


@WebServlet("/CommunityPostCon")
public class CommunityPostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		CommunityDAO dao = new CommunityDAO();
		
		CommunityDTO post = dao.commOneSelect(seq);
		
		if(post != null) {
			System.out.println("게시글 진입 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("post", post);
			response.sendRedirect("communityPost.jsp");
		} else {
			System.out.println("게시글 진입 실패..");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('제시글 진입 실패..');");
			out.print("community.jsp';");
			out.print("</script>");
			
		}
		
	}

}
