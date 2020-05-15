package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class InsertNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {		
		
		String flag = request.getParameter("flag");
		
		request.setAttribute("flag", flag);
		
		return "/admin/insertNotice.jsp";
	}
}
