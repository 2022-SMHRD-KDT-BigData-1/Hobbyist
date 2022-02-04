package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.MemberDAO;


@WebServlet("*.do")
//확장자 패턴...?
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, iCommand> map;
	
	
	@Override
	//init은 제일 처음에 딱 1번만 실행함.
	public void init() throws ServletException {
		//서버가 실행할 때 특정값들을 초기화해주는 메소드
		map = new HashMap<String, iCommand>();
		map.put("/LoginCon.do", new LoginCon());
		map.put("/JoinCon.do", new JoinCon());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=requestURI.substring(contextPath.length());
		
//		System.out.println(requestURI);
//		System.out.println(contextPath);
		System.out.println("들어온 요청 : "+command);
		
		
		iCommand com = map.get(command);
		com.execute(request, response); 
		
		/* request.setCharacterEncoding("utf-8");
		 * String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("m_tel");
		String address = request.getParameter("m_address");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		 * */
		/*if(command.equals("/LoginCon.do")) {
			//로그인 처리
			LoginCon login = new LoginCon();
			login.execute(request, response);
			
		}else if(command.equals("/JoinCon.do")) {
			//회원가입 처리
			JoinCon join = new JoinCon();
			join.execute(request,response);
		}*/
//		if(command.equals("/Login.do")) {
//			//로그인 처리
//
//			MemberDTO member = dao.memberLogin(email, pw);
//			
//			if(member != null) { 
//				System.out.println("로그인 성공!");
//				//세션생성
//				HttpSession session = request.getSession();
//				session.setAttribute("member", member);
//				response.sendRedirect("main.jsp");
//			}else {
//				//로그인 실패 알림창 띄운 후 main.jsp로 이동하기
//				System.out.println("실패..");
//				
//				out.print("<script>");
//				out.print("alert('로그인 실패..!');");
//				out.print("location.href='main.jsp';");
//				out.print("</script>");
//			}
//		}else if(command.equals("/Join.do")) {
//			
//			RequestDispatcher dispatcher;
//			int cnt = dao.memberJoin(new MemberDTO(email, pw, tel, address));
//			
//			System.out.println(cnt);
//			
//			if(cnt>0) {
//				//포워드 방식으로 페이지 이동
//				request.setAttribute("success_data", email);
//				dispatcher=request.getRequestDispatcher("join_success.jsp");
//				dispatcher.forward(request, response);
//			}else {
//				System.out.println("실패..");
//
//				out.print("<script>");
//				out.print("alert('회원가입 실패..!');");
//				out.print("location.href='main.jsp';");
//				out.print("</script>");
//			}
//		}
	}

}
