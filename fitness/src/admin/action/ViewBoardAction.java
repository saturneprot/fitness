package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class ViewBoardAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.viewBoard2(b_num);
		request.setAttribute("dto", dto);
		return "/admin/viewBoard.jsp";
	}
}
