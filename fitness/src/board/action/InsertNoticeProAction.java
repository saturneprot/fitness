package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;
import post.NoticeBoardDTO;

public class InsertNoticeProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int currentPage = 0;//현재 페이지---
		int currentBlock=0;//현재 블럭---
		
		
		String keyField="";//
		String keyWord="";//
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String date = sdf.format(new Date());
		//System.out.println(date);
		
		if(request.getParameter("keyField")!=null) {
			keyField=request.getParameter("keyField");//
		}
		if(request.getParameter("keyWord")!=null) {
			keyWord=request.getParameter("keyWord");//
		}
			
		if(request.getParameter("page")!=null) {
			currentPage=Integer.parseInt(request.getParameter("page"));//
		}
		if(request.getParameter("block")!=null) {
			currentBlock=Integer.parseInt(request.getParameter("block"));//
		}
		
		int bc_num = Integer.parseInt(request.getParameter("bc_num"));
		String nb_subject = request.getParameter("nb_subject");
		String nb_content = request.getParameter("nb_content");
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setBc_num(bc_num);
		dto.setNb_subject(nb_subject);
		dto.setNb_content(nb_content);
		
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		dao.insertBoard(dto);
		
//		request.setAttribute("page", currentPage);
//	    request.setAttribute("block", currentBlock);
//	    request.setAttribute("keyField", keyField);
//	    request.setAttribute("keyWord", keyWord);
		
		return "/admin/insertNoticePro.jsp";
	}
	
}
