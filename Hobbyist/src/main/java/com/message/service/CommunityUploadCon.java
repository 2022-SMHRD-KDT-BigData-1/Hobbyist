package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.CommunityDAO2;
import com.message.model.CommunityDTO2;


@WebServlet("/CommunityUploadCon")
public class CommunityUploadCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");
		
		CommunityDAO2 dao = new CommunityDAO2();
		
		int cnt = dao.insertDB(null,nick,pw,title,content,df,0,ip); // getList 메서드 호출
		
		
		
		
		

//		CommunityDAO dao = new CommunityDAO();
//
//		int cnt = dao.commUpload(new CommunityDTO(0, nick, title, content, pw, 0, null));
		
		
		if (cnt > 0) {
			System.out.println("게시글 전송 성공!");
			response.sendRedirect("community.jsp");
		} else {
			System.out.println("게시글 전송 실패..");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('게시글 전송 실패..');");
			out.print("location.href='community.jsp';");
			out.print("</script>");
		}
	}

}
