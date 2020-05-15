package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;

public class DeleteNoticeProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int nb_num = Integer.parseInt(request.getParameter("nb_num"));
		String keyField="";
		String keyWord="";
		int page=0;
		int block=0;
		if(request.getParameter("keyField")!="") {
			keyField=request.getParameter("keyField");
		}
		if(request.getParameter("keyWord")!="") {
			keyWord=request.getParameter("keyWord");
		}
		if(request.getParameter("page")!="") {
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("block")!="") {
			block=Integer.parseInt(request.getParameter("block"));
		}
		
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		dao.deleteNBoard(nb_num);
		
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("page", page);
		request.setAttribute("block",block);
		
		return "/admin/deleteNoticePro.jsp";
	}
}
