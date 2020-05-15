package admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import order.OrderDetailDAO;
import order.OrderDetailDTO;

public class ViewProductsAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String order_num = request.getParameter("order_num");
		OrderDetailDAO dao = OrderDetailDAO.getInstance();
		List<OrderDetailDTO> list = dao.getOrderDetailList(order_num);
		request.setAttribute("order_num", order_num);
		request.setAttribute("list", list);
		return "/admin/viewProducts.jsp";
	}
}
