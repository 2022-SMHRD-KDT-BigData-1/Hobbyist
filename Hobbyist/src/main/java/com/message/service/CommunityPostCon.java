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
		
		String email = request.getParameter("e-mail");
		String pw = request.getParameter("pw");
		
		CommunityDAO dao = new CommunityDAO();
		
		CommunityDTO post = dao.commOneSelect();
		
		if(member != null) {
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("main_jstl.jsp");
		} else {
			System.out.println("로그인 실패..");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 실패..');");
			out.print("location.href='main_jstl.jsp';");
			out.print("</script>");
			
		}
		
	}

}
