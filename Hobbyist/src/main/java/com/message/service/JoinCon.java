package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.MemberDAO;
import com.message.model.MemberDTO;




public class JoinCon implements iCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//���̵�, �н�����, �г����� ������ ����
		String email = request.getParameter("m_email");
		String pw = request.getParameter("m_pw");
		String nick = request.getParameter("m_nick");
		String tel = request.getParameter("m_tel");
		String address = request.getParameter("m_address");
		
		MemberDAO dao = new MemberDAO();
		
		
		RequestDispatcher dispatcher;
		int cnt = dao.memberJoin(new MemberDTO(email, pw, nick, tel, address, nick, tel, address));
		
		System.out.println(cnt);
		
		if(cnt>0) {
			//������ ������� ������ �̵�
			request.setAttribute("success_data", email);
			dispatcher=request.getRequestDispatcher("join_success.jsp");
			dispatcher.forward(request, response);
		}else {
			System.out.println("����..");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('ȸ������ ����..!');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
	}
	}


