package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;
import post.NoticeBoardDTO;

public class ViewNoticeBoardAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int nb_num = Integer.parseInt(request.getParameter("nb_num"));
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		NoticeBoardDTO dto = dao.viewNoticeBoard2(nb_num);
		
		request.setAttribute("dto", dto);
		return "/admin/viewNoticeBoard.jsp";
	}
}
