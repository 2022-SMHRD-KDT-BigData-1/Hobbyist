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

@WebServlet("/CommunityUploadCon")
public class CommunityUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		CommunityDTO community = (CommunityDTO) session.getAttribute("community");
		String nick = community.getM_nick();

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		CommunityDAO dao = new CommunityDAO();
		int cnt = dao.commUpdate(new CommunityDTO(0, nick, title, content, null, 0, null), null);

		if (cnt > 0) {
			System.out.println("게시글 수정 성공!");
			session.setAttribute("community", new CommunityDTO(0, nick, title, content, null, 0, null));
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("게시글 수정 실패..");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 수정 실패..');");
			out.print("location.href='community.jsp';");
			out.print("</script>");
		}

	}

}
