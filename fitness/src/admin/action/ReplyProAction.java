package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.BoardDAO;
import post.BoardDTO;

public class ReplyProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		System.out.println(b_num);
		int bc_num = Integer.parseInt(request.getParameter("bc_num"));
		String b_subject=request.getParameter("b_subject");
		String b_content=request.getParameter("b_content");
		String b_re = request.getParameter("b_re");
		String mid = request.getParameter("mid");
		BoardDTO dto = new BoardDTO();
		dto.setBc_num(bc_num);
		dto.setMid("admin");
		dto.setB_subject(b_subject);
		dto.setB_content(b_content);
		dto.setB_re(b_re);
		dto.setB_sup(mid);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto2 = dao.getPosDepth(b_num);
		dto.setB_pos(dto2.getB_pos());
		//System.out.println("b_pos : " + dto.getB_pos());
		dao.raise(dto2.getB_pos());
		dao.insertReply(dto);
		return "/admin/replyPro.jsp";
	}
}
