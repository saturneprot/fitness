package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import command.CommandAction;

public class MainAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
//		String mid = (String)session.getAttribute("mid");
//		int totalR=0;
//		CartDAO dao = CartDAO.getInstance();
//		if(mid!=null) {
//			totalR=dao.getTotalCart(mid);
//			System.out.println(totalR+"HIHI");
//		}
//		request.setAttribute("totalRR", totalR);
		return "/main/main.jsp";
	}
}
