package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class ViewRQuestionAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.increaseCount(b_num);
		BoardDTO dto = dao.viewBoard2(b_num);
		request.setAttribute("dto", dto);
		return "/main/viewRQuestion.jsp";
	}
}
