package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MemberDAO;
import com.message.model.MemberDTO;
import com.message.model.MessageDAO;


@WebServlet("/MemberSelectAllCon")
public class MemberSelectAllCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberDTO> members=  dao.memberSelectAll();
		//members라는 객체정보를 select.jsp로 전달하기 위해 forward방식 활용
		//redirect방식은 텍스트 데이터만 전달 가능하기 때문
		request.setAttribute("members", members);
		
	/*session을 사용하지 않고 request를 사용하는 이유
	-> 회원들의 정보는 select.jsp에서만 출력할것이기 때문에 request영역에 저장함.
	세션에 저장하면 브라우저 종료될때까지 정보가 유지됨.
	(다른 페이지로 넘어가도 이 정보들이 그대로 남아있기 때문에 서버 용량에 부하가 생길 수 있음)*/
		RequestDispatcher dispatcher=request.getRequestDispatcher("select.jsp");
		dispatcher.forward(request, response);
		
	}

}
