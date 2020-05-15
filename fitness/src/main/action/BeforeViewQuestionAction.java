package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class BeforeViewQuestionAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String b_num=request.getParameter("b_num");
		request.setAttribute("b_num", b_num);
		return "/main/beforeViewQuestion.jsp";
	}
}
