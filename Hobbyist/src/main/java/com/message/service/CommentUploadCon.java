package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.CommentDAO;
import com.message.model.CommentDTO;

@WebServlet("/CommentUploadCon")
public class CommentUploadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String nick = request.getParameter("nick");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pw = request.getParameter("pw");
		String date = request.getParameter("date");

		CommentDAO dao = new CommentDAO();

		int cnt = dao.commentUpload(new CommentDTO(0, 0, nick, content, date, pw), null, null);

		if (cnt > 0) {
			System.out.println("댓글 전송 성공!");
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("댓글 전송 실패..");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 전송 실패..');");
			out.print("location.href='comment.jsp';");
			out.print("</script>");
		}

	}

}
