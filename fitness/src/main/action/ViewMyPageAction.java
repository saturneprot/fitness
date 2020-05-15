package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.MemberDAO;
import member.MemberDTO;

public class ViewMyPageAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.viewMyPage(mid);
		
		request.setAttribute("dto", dto);
		return "/main/viewMyPage.jsp";
	}
}
