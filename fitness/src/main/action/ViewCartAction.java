package main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import cart.CartDTO;
import command.CommandAction;

public class ViewCartAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid");
		CartDAO dao = CartDAO.getInstance();
		List<CartDTO> list = dao.getCartList(mid);
		
		request.setAttribute("list", list);		
		return "/main/viewCart.jsp";
	}
}
