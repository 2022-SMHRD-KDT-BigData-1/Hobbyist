package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MemberDAO;
import com.message.model.MemberDTO;


public class LoginCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO member = dao.memberLogin(email, pw);
		
		if(member != null) { 
			System.out.println("�α��� ����!");
			//���ǻ���
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("main_jstl.jsp");
		}else {
			//�α��� ���� �˸�â ��� �� main.jsp�� �̵��ϱ�
			System.out.println("����..");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�α��� ����..!');");
			out.print("location.href='main_jstl.jsp';");
			out.print("</script>");
		}
	}

}
