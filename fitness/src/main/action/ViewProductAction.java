package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;
import product.ProductDTO;

public class ViewProductAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String page=request.getParameter("page");
		String block=request.getParameter("block");
		String keyField=request.getParameter("keyField");
		String keyWord=request.getParameter("keyWord");
		String flag=request.getParameter("flag");
		
		int p_num=Integer.parseInt(request.getParameter("p_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.clickProduct(p_num);
		
		request.setAttribute("flag", flag);
		request.setAttribute("block", block);
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("viewdto", dto);
		
		return "/main/viewProduct.jsp";
	}	
}
