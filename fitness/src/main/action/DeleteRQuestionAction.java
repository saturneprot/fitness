package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;

public class DeleteRQuestionAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(b_num);
		
		return "/main/deleteRQuestion.jsp";
	}
}
