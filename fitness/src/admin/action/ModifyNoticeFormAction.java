package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;
import post.NoticeBoardDTO;

public class ModifyNoticeFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int nb_num = Integer.parseInt(request.getParameter("nb_num"));
		int block=0;
		int page=0;
		String keyField="";
		String keyWord="";
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		NoticeBoardDTO dto = dao.getModifyForm(nb_num);
		if(request.getParameter("keyField")!="") {
			keyField = request.getParameter("keyField");
		}
		if(request.getParameter("keyWord")!="") {
			keyWord = request.getParameter("keyWord");
		}
		if(request.getParameter("block")!="") {
			block = Integer.parseInt(request.getParameter("block"));
		}
		if(request.getParameter("page")!="") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("p_num", nb_num);
		request.setAttribute("dto", dto);
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("block", block);
		request.setAttribute("page", page);
		return "/admin/modifyNoticeForm.jsp";
	}
}
