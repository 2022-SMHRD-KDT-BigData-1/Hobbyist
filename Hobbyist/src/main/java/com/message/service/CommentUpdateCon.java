package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.CommentDAO;
import com.message.model.CommentDTO;

@WebServlet("/CommentDeleteCon")
public class CommentUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		CommentDTO comment = (CommentDTO) session.getAttribute("comment");
		String nick = comment.getM_nick();

		String content = request.getParameter("content");

		CommentDAO dao = new CommentDAO();
		int cnt = dao.commentUpdate(new CommentDTO(0, 0, nick, content, null, null), null, null);

		if (cnt > 0) {
			System.out.println("댓글 수정 성공!");
			session.setAttribute("comment", new CommentDTO(0, 0, nick, content, null, null));
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("댓글 수정 실패..");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 수정 실패..');");
			out.print("location.href='comment.jsp';");
			out.print("</script>");
		}

	}

}
