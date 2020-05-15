package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;

public class ModifyNoticeProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int nb_num = Integer.parseInt(request.getParameter("nb_num"));
		String nb_subject = request.getParameter("nb_subject");
		String nb_content = request.getParameter("nb_content");
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		dao.modifyNotice(nb_num, nb_subject, nb_content);
		
		return "/admin/boardList.do?flag=notice";
	}
}
