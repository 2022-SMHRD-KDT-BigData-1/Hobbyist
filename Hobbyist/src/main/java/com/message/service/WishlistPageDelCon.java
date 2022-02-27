package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MemberDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

@WebServlet("/WishlistPageDelCon")
public class WishlistPageDelCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String a_id = request.getParameter("Del"); 
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		WishlistDTO wishDelete = new WishlistDTO(0, 0, member.getM_email(), a_id);
		WishlistDAO dao = new WishlistDAO();
		
		int cnt = dao.wishDelete(wishDelete);
		
		if(cnt > 0) {
				System.out.println("위시리스트 삭제 성공");
				out.print("<script>");
				out.print("alert('위시리스트 삭제 성공');");
				out.print("</script>");
				response.sendRedirect("WishlistSelectCon");
//				String pageNum = (String) session.getAttribute("pageNum");
//				response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
			}else {
				System.out.println("위시리스트 삭제 실패");
				out.print("<script>");
				out.print("alert('위시리스트 삭제 실패');");
				out.print("location.href='Recommend.jsp';");
				out.print("</script>");
			}
		
		
		
	}

}
