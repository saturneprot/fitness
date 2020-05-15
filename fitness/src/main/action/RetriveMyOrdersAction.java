package main.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import order.OrderDAO;
import order.OrderDTO;

public class RetriveMyOrdersAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");
		OrderDAO dao = OrderDAO.getInstance();
		List<OrderDTO> list = dao.getOrdersList(mid);
		//System.out.println(list.size());
		request.setAttribute("list", list);
		return "/main/retrieveMyOrders.jsp";
	}
}
