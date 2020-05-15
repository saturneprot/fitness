package main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import order.OrderDAO;
import order.OrderDTO;

public class ViewDetailAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String order_num=request.getParameter("order_num");
		OrderDAO dao = OrderDAO.getInstance();
		OrderDTO dto = dao.getDetail(order_num);
		request.setAttribute("dto", dto);
		return "/main/viewDetail.jsp";
	}
}
