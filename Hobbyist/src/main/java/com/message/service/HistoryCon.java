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

import com.message.model.AddrDTO;
import com.message.model.HistoryDAO;
import com.message.model.HistoryDTO;
import com.message.model.MemberDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

/**
 * Servlet implementation class HistoryCon
 */
@WebServlet("/HistoryCon")
public class HistoryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {
			out.print("<script>");
			out.print("alert('로그인 후 이용하실 수 있습니다.');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
		if(session.getAttribute("H_select") != null) {
			session.removeAttribute("H_select");
			session.removeAttribute("H_select2");
		}
			
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		String email = member.getM_email();
		HistoryDAO dao = new HistoryDAO();
		
		ArrayList <AddrDTO> history2 = dao.H_Select2(email);
		ArrayList <HistoryDTO> history = dao.H_Select(email);
		
		session.setAttribute("H_select", history);
		session.setAttribute("H_select2", history2);
		
		response.sendRedirect("history.jsp");
		
		
	}

}
