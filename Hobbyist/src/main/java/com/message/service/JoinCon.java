package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MemberDAO;
import com.message.model.MemberDTO;




public class JoinCon implements iCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//���̵�, �н�����, �г����� ������ ����
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		String address= request.getParameter("address");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String a_id = request.getParameter("a_id");
		
		MemberDAO dao = new MemberDAO();
		
		
		
		MemberDTO dto= new MemberDTO(email, pw, name, nick, tel, address, age, gender,a_id);
		RequestDispatcher dispatcher;
		int cnt = dao.memberJoin(new MemberDTO(email, pw, name, nick, tel, address, age, gender,a_id));
		
		System.out.println(cnt);
		
		if(cnt>0) {
			//������ ������� ������ �̵�
			request.setAttribute("success_data", dto);
			
			
			dispatcher=request.getRequestDispatcher("main_success.jsp");
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


