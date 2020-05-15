package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;

public class ModifyReplyProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String b_re = request.getParameter("b_re");
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateRe(b_num, b_re);
		
		return "/admin/modifyReplyPro.jsp";
	}
}
