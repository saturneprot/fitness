package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;
import product.ProductDTO;

public class ClickProductNameAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.clickProductName(p_num);
		request.setAttribute("dto", dto);
		return "/admin/clickProductName.jsp";
	}
}//
