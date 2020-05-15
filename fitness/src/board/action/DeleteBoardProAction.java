package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;

public class DeleteBoardProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String keyField=request.getParameter("keyField");
		String keyWord=request.getParameter("keyWord");
		String page=request.getParameter("page");
		String block=request.getParameter("block");
		
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(b_num);
		
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("page", page);
		request.setAttribute("block",block);
		
		return "/admin/deleteBoardPro.jsp";
	}
}
