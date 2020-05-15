package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class WriteQuestionProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int bc_num=Integer.parseInt(request.getParameter("bc_num"));
		String mid = request.getParameter("mid");
		String b_subject=request.getParameter("b_subject");
		String b_content=request.getParameter("b_content");
		String b_pwd = request.getParameter("b_pwd");
		
		BoardDTO dto = new BoardDTO();
		dto.setBc_num(bc_num);
		dto.setMid(mid);
		dto.setB_subject(b_subject);
		dto.setB_content(b_content);
		dto.setB_pwd(b_pwd);
		BoardDAO dao = BoardDAO.getInstance();
		dao.insertBoard(dto);
		
		/* return "/main/viewQNABoard.do?flag=userQ"; */
		return "/main/writeQuestionPro.jsp";
	}
}
