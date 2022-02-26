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

import com.message.model.AcademyDTO;
import com.message.model.AddrDTO;
import com.message.model.MemberDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

@WebServlet("/WishlistSelectCon")
public class WishlistSelectCon extends HttpServlet {
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
		if(session.getAttribute("wishselect") != null) {
			session.removeAttribute("wishselect");
		}
			
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String email = member.getM_email();
		WishlistDAO dao = new WishlistDAO();
		
		ArrayList <AddrDTO> wishselect = dao.WishSelect(email);
		ArrayList <WishlistDTO> wishselect2 = dao.WishSelect2(email);
		
		session.setAttribute("wishselect", wishselect);
		session.setAttribute("wishselect2", wishselect2);
		
		response.sendRedirect("wishList.jsp");
		
		
	}

}
