package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.HistoryDAO;
import com.message.model.HistoryDTO;
import com.message.model.MemberDTO;

@WebServlet("/HistoryDeleteCon")
public class HistoryDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String ac_id = request.getParameter("ac"); 
		System.out.println(ac_id+"con단 ac_id");
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		HistoryDTO hisDelete = new HistoryDTO(0,null,null,ac_id,member.getM_email());
		HistoryDAO dao = new HistoryDAO();
		
		int cnt = dao.hisDelete(hisDelete);
		
		if(cnt > 0) {
				out.print("<script>");
				out.print("alert('삭제 성공');");
				out.print("</script>");
				response.sendRedirect("HistoryCon");
//				String pageNum = (String) session.getAttribute("pageNum");
//				response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
			}else {
				System.out.println("수강이력 삭제 실패");
				out.print("<script>");
				out.print("alert('수강이력 삭제 실패');");
				out.print("location.href='HistoryCon';");
				out.print("</script>");
			}

		
		
		
		
		
	}

}
