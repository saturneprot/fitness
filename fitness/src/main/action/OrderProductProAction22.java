package main.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import order.OrderDAO;
import order.OrderDTO;
import order.OrderDetailDAO;
import order.OrderDetailDTO;
import product.ProductDAO;

public class OrderProductProAction22 implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		int order_quantity=Integer.parseInt(request.getParameter("quantity"));
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddkkmmss");
		String imsi=sdf.format(date);
		String mid = request.getParameter("mid");
		System.out.println(imsi+mid);
		String order_num = imsi+mid;
		OrderDTO dto = new OrderDTO();
		dto.setOrder_num(order_num);
		dto.setMid(mid);
		dto.setO_name(request.getParameter("o_name"));
		dto.setO_number(request.getParameter("o_number"));
		dto.setO_email(request.getParameter("o_email"));
		dto.setO_addr1(request.getParameter("o_addr1"));
		dto.setO_addr2(request.getParameter("o_addr2"));
		dto.setO_comment(request.getParameter("o_comment"));
		dto.setO_pay(request.getParameter("o_pay"));
		OrderDAO dao = OrderDAO.getInstance();
		dao.insertOrder(dto);
		OrderDetailDAO dao2 = OrderDetailDAO.getInstance();
		ProductDAO pdao = ProductDAO.getInstance();
		dao2.insertOrderDetail22(p_num, order_num, order_quantity);
		pdao.decreaseCnt(p_num, order_quantity);
		List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
		list=dao2.getOrderDetailList(order_num);
		OrderDTO dtoR=dao.getDetail(order_num);
		request.setAttribute("dto", dtoR);
		request.setAttribute("list", list);
		return "/main/orderProductPro.jsp";
	}
}
