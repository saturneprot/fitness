package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class BeforeViewMyPageAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String mid=request.getParameter("mid");
		request.setAttribute("mid", mid);
		return "/main/beforeViewMyPage.jsp";
	}
}
