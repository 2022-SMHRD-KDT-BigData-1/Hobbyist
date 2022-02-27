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
import com.message.model.HistoryDTO;
import com.message.model.MemberDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

@WebServlet("/ManageCon")
public class ManageCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		
		String classname = request.getParameter("classname"); 
		String city = request.getParameter("city");
		String[] day = request.getParameterValues("day");
		String day2 = "";
		for(int i = 0; i < day.length; i++) {
			day2 += day[i] + ",";
		}
		String time = request.getParameter("time");
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		HistoryDTO inputHis = new HistoryDTO(0,);
		int cnt = dao.wishCreate(inputHis);
		
		if(cnt > 0) {
			System.out.println("위시리스트 등록 성공");
			if(session.getAttribute("wish") != null) {
				ArrayList <WishlistDTO> wish = (ArrayList <WishlistDTO>) session.getAttribute("wish");
				session.removeAttribute("wish");
				ArrayList <AddrDTO> recommend = (ArrayList<AddrDTO>) session.getAttribute("recommend");
				for(int i = 0; i<wish.size();i++) {
					if(recommend.get(i).getAc_id().equals(a_id)) {
						wish.remove(i);
						wish.add(i, new WishlistDTO(0,1,null,null));
						session.setAttribute("wish", wish);
						break;
					}
				}
				String pageNum = (String) session.getAttribute("pageNum");
				response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
			}else {
				System.out.println("위시리스트 등록 실패");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('위시리스트 등록 실패');");
				out.print("location.href='Recommend.jsp';");
				out.print("</script>");
			}
	}
}
