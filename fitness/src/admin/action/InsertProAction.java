package admin.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;

public class InsertProAction extends HttpServlet implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.insertProduct(request);
		
		return "/admin/insertPro.jsp";
	}
}//end class;
