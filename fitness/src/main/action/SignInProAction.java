package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.MemberDAO;
import member.MemberDTO;

public class SignInProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		MemberDTO dto = new MemberDTO();
		String id = request.getParameter("id");
		dto.setMid(request.getParameter("mid"));
		dto.setMpwd(request.getParameter("mpwd"));
		dto.setMname(request.getParameter("mname"));
		dto.setMnumber(request.getParameter("mnumber"));
		dto.setMemail(request.getParameter("memail"));
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.insertMember(dto);
		
		request.setAttribute("id", id);
		return "/main/signInPro.jsp";
	}
}
