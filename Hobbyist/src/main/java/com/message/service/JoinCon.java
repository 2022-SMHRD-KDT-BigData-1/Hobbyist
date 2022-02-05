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
		
		//아이디, 패스워드, 닉네임을 변수에 저장
		String email = request.getParameter("m_email");
		String pw = request.getParameter("m_pw");
		String name = request.getParameter("m_name");
		String nick = request.getParameter("m_nick");
		String tel = request.getParameter("m_tel");
		String address= request.getParameter("m_address");
		String age = request.getParameter("m_age");
		String gender = request.getParameter("m_gender");
		String a_id = request.getParameter("a_id");
		
		MemberDAO dao = new MemberDAO();
		
		
		
		
		RequestDispatcher dispatcher;
		int cnt = dao.memberJoin(new MemberDTO(email, pw, name, nick, tel, address, age, gender, a_id));
		
		System.out.println(cnt);
		
		if(cnt>0) {
			//포워드 방식으로 페이지 이동
			request.setAttribute("success_data", email);
			dispatcher=request.getRequestDispatcher("join_success.jsp");
			dispatcher.forward(request, response);
		}else {
			System.out.println("실패..");
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입 실패..!');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
	}
	}


