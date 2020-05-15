package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;

public class DeleteProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String keyField=request.getParameter("keyField");
		String keyWord=request.getParameter("keyWord");
		String page=request.getParameter("page");
		String block=request.getParameter("block");
		
		int p_num=Integer.parseInt(request.getParameter("p_num"));
		ProductDAO dao = ProductDAO.getInstance();
		boolean result = dao.deleteProduct(request, p_num);
		
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("page", page);
		request.setAttribute("block",block);
		
		return "/admin/productList.do";
	}
}
