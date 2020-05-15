package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class ModifyRQuestionProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String b_subject=request.getParameter("b_subject");
		String b_content=request.getParameter("b_content");
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = new BoardDTO();
		dto.setB_num(b_num);
		dto.setB_subject(b_subject);
		dto.setB_content(b_content);
		dao.updateBoard(dto);
		return "/main/viewQNABoard.do?flag=userQ";
	}
}
