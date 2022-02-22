package com.message.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.AcademyDTO;
import com.message.model.MemberDTO;
import com.message.model.WishlistDAO;
import com.message.model.WishlistDTO;

@WebServlet("/WishListInputCon")
public class WishListInputCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		if(session.getAttribute("member") == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 이용하실 수 있습니다.');");
			out.print("location.href='Recommend.jsp';");
			out.print("</script>");
		}
		
		request.setCharacterEncoding("utf-8");
		
		
		String a_id = request.getParameter("a_idToWish"); 
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		WishlistDTO wishCreate = new WishlistDTO(0, 0, member.getM_email(), a_id);
		WishlistDAO dao = new WishlistDAO();
		
		int cnt = dao.wishCreate(wishCreate);
		
		if(cnt > 0) {
			System.out.println("위시리스트 등록 성공");
//			if(session.getAttribute("member") != null) {
//				session.removeAttribute("wish");
//				ArrayList <AcademyDTO> recommend = (ArrayList<AcademyDTO>) session.getAttribute("recommend");
//				String email = member.getM_email();
//				ArrayList<WishlistDTO> wish = dao.recoWishSelect(recommend, email);
//				session.setAttribute("wish", wish);
//			}
			ArrayList <WishlistDTO> wish = (ArrayList <WishlistDTO>) session.getAttribute("wish");
			session.removeAttribute("wish");
			ArrayList <AcademyDTO> recommend = (ArrayList<AcademyDTO>) session.getAttribute("recommend");
			for(int i = 0; i<wish.size();i++) {
					if(recommend.get(i).getA_id().equals(a_id)) {
						wish.remove(i);
						wish.add(i, new WishlistDTO(0,1,null,null));
						session.setAttribute("wish", wish);
						break;
					}
				}
				String pageNum = (String) session.getAttribute("pageNum");
				response.sendRedirect("Recommend.jsp?pageNum=" + pageNum);
			}else {
				System.out.println("위시리스트 등록 실패");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('위시리스트 등록 실패');");
				out.print("location.href='Recommend.jsp';");
				out.print("</script>");
			}
			
		}
	}


