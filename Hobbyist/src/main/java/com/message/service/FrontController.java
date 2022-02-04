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
//Ȯ���� ����...?
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, iCommand> map;
	
	
	@Override
	//init�� ���� ó���� �� 1���� ������.
	public void init() throws ServletException {
		//������ ������ �� Ư�������� �ʱ�ȭ���ִ� �޼ҵ�
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
		System.out.println("���� ��û : "+command);
		
		
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
			//�α��� ó��
			LoginCon login = new LoginCon();
			login.execute(request, response);
			
		}else if(command.equals("/JoinCon.do")) {
			//ȸ������ ó��
			JoinCon join = new JoinCon();
			join.execute(request,response);
		}*/
//		if(command.equals("/Login.do")) {
//			//�α��� ó��
//
//			MemberDTO member = dao.memberLogin(email, pw);
//			
//			if(member != null) { 
//				System.out.println("�α��� ����!");
//				//���ǻ���
//				HttpSession session = request.getSession();
//				session.setAttribute("member", member);
//				response.sendRedirect("main.jsp");
//			}else {
//				//�α��� ���� �˸�â ��� �� main.jsp�� �̵��ϱ�
//				System.out.println("����..");
//				
//				out.print("<script>");
//				out.print("alert('�α��� ����..!');");
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
//				//������ ������� ������ �̵�
//				request.setAttribute("success_data", email);
//				dispatcher=request.getRequestDispatcher("join_success.jsp");
//				dispatcher.forward(request, response);
//			}else {
//				System.out.println("����..");
//
//				out.print("<script>");
//				out.print("alert('ȸ������ ����..!');");
//				out.print("location.href='main.jsp';");
//				out.print("</script>");
//			}
//		}
	}

}
