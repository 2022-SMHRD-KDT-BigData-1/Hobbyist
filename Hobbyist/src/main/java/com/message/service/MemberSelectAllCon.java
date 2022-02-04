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
		//members��� ��ü������ select.jsp�� �����ϱ� ���� forward��� Ȱ��
		//redirect����� �ؽ�Ʈ �����͸� ���� �����ϱ� ����
		request.setAttribute("members", members);
		
	/*session�� ������� �ʰ� request�� ����ϴ� ����
	-> ȸ������ ������ select.jsp������ ����Ұ��̱� ������ request������ ������.
	���ǿ� �����ϸ� ������ ����ɶ����� ������ ������.
	(�ٸ� �������� �Ѿ�� �� �������� �״�� �����ֱ� ������ ���� �뷮�� ���ϰ� ���� �� ����)*/
		RequestDispatcher dispatcher=request.getRequestDispatcher("select.jsp");
		dispatcher.forward(request, response);
		
	}

}
