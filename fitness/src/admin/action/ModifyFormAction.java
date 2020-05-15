package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;
import product.ProductDTO;

public class ModifyFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getModifyForm(p_num);
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		int block = Integer.parseInt(request.getParameter("block"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		request.setAttribute("p_num", p_num);
		request.setAttribute("dto", dto);
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("block", block);
		request.setAttribute("page", page);
		return "/admin/modifyForm.jsp";
	}
}
