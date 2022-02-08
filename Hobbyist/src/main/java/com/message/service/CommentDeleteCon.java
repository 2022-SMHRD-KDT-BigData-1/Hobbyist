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
public class CommentDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CommentDTO list = (CommentDTO) session.getAttribute("list");

		String num = request.getParameter("num");
		String nick = list.getM_nick();

		CommentDAO dao = new CommentDAO();

		int cnt = dao.commentDelete(nick, num);

		if (cnt > 0) {
			System.out.println("댓글 삭제 성공!");
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("댓글 삭제 실패..");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('댓글 전송 실패..');");
			out.print("location.href='comment.jsp';");
			out.print("</script>");
		}

	}

}
