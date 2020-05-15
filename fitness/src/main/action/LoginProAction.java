package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class LoginProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String mid= request.getParameter("mid");
		request.setAttribute("mid", mid);
		return "/main/loginPro.jsp";
		
	}
}
