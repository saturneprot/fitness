package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class ModifyRQuestionAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.viewBoard2(b_num);
		
		request.setAttribute("dto", dto);
		return "/main/modifyRQuestion.jsp";
	}
}
