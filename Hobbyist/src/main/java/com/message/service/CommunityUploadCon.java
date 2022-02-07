package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.CommunityDAO;
import com.message.model.CommunityDTO;


@WebServlet("/CommunityUploadCon")
public class CommunityUploadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String nick = request.getParameter("nick");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pw = request.getParameter("pw");
		String date = request.getParameter("date");

		CommunityDAO dao = new CommunityDAO();

		int cnt = dao.commUpload(new CommunityDTO(0, nick, title, content, pw, 0, date), null);
		
		
		if (cnt > 0) {
			System.out.println("게시글 전송 성공!");
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("게시글 전송 실패..");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 전송 실패..');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

	}

}
