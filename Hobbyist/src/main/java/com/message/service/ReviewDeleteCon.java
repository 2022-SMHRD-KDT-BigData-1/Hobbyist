package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.ReviewDAO;
import com.message.model.ReviewDTO;

@WebServlet("/ReviewDeleteCon")
public class ReviewDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String re_nick = request.getParameter("re_nick");  
		String re_pw = request.getParameter("re_pw");  
		String re_id = request.getParameter("re_id");  
		
		Integer int_null = null;
		ReviewDTO review = new ReviewDTO(int_null, re_nick, null, re_pw, null, int_null, null, re_id);
		ReviewDAO dao = new ReviewDAO();
		
		int cnt =  dao.revDelete(review);
		if(cnt >0) {
			System.out.println("��������Ϸ�");
			response.sendRedirect("��������� ���ư� ������"); // ���� ���� 
		}else {
			System.out.println("�����������");
			out.print("<script>");
			out.print("alert('�����������');");
			out.print("location.href='���ư�������';"); //���� ���� 
			out.print("</script>");
		}
	}

}
