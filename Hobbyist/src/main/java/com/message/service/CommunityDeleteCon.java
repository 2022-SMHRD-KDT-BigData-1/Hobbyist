package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.CommunityDAO2;
import com.message.model.CommunityDTO2;

@WebServlet("/CommunityDeleteCon")
public class CommunityDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		CommunityDTO2 list = (CommunityDTO2) session.getAttribute("list");

		String num = request.getParameter("num");
		String nick = list.getM_nick();

		CommunityDAO2 dao = new CommunityDAO2();

//		int cnt = dao.commDelete(nick, num);
//
//		if (cnt > 0) {
//			System.out.println("�Խñ� ���� ����!");
//			response.sendRedirect("main.jsp");
//		} else {
//			System.out.println("�Խñ� ���� ����..");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print("alert('�Խñ� ���� ����..');");
//			out.print("location.href='community.jsp';");
//			out.print("</script>");
//		}

	}

}
