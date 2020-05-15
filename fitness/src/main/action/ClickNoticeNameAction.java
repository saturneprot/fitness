package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;
import post.NoticeBoardDTO;

public class ClickNoticeNameAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int nb_num = Integer.parseInt(request.getParameter("nb_num"));
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		dao.increaseCount(nb_num);
		NoticeBoardDTO dto = dao.clickNoticeName2(nb_num);
		
		request.setAttribute("dto", dto);
		return "/main/clickNoticeName.jsp";
	}
}
