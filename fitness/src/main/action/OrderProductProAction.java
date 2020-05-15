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

public class OrderProductProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		ProductDAO pdao = ProductDAO.getInstance();
		
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
		String[] cart_nums=request.getParameterValues("cart_num");
		
		String[] p_nums = request.getParameterValues("p_num");
		String[] cart_quantities=request.getParameterValues("cart_quantity");
		OrderDetailDTO dto2 = null;
		OrderDetailDAO dao2 = OrderDetailDAO.getInstance();
		//int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		for(int i = 0; i < cart_nums.length;i++) {//장바구니번호, 상품번호, 장바구니수량
			//System.out.println("cart_num : " + str11[i] + " / p_num : " + str33[i] + " / cart_quantity : " + str22[i]);
			dto2 = new OrderDetailDTO();
			dto2.setP_num(Integer.parseInt(p_nums[i]));
			dto2.setOrder_num(order_num);
			dto2.setOrder_quantity(Integer.parseInt(cart_quantities[i]));
			dto2.setCart_num(Integer.parseInt(cart_nums[i]));
			pdao.decreaseCnt(Integer.parseInt(p_nums[i]), Integer.parseInt(cart_quantities[i]));
			dao2.insertOrderDetail(dto2);
		}
		List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
		list=dao2.getOrderDetailList(order_num);
		OrderDTO dtoR=dao.getDetail(order_num);
		request.setAttribute("dto", dtoR);
		request.setAttribute("list", list);
		return "/main/orderProductPro.jsp";
	}
}
