package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.MemberDAO;

public class FindIdProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String mname = request.getParameter("mname");
		String mnumber=request.getParameter("mnumber");
		MemberDAO dao = MemberDAO.getInstance();
		String id = dao.getId(mname, mnumber);
		int len=id.length();
		String imsi=id.substring(0, len-3);
		//System.out.println(imsi);
		String mid=imsi+"***";
		request.setAttribute("mid", mid);
		return "/main/findIdPro.jsp";
	}
}
