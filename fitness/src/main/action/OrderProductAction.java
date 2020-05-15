package main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import cart.CartDTO;
import command.CommandAction;
import member.MemberDAO;
import member.MemberDTO;
//OrderProductAction
public class OrderProductAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String flag = request.getParameter("flag");
		String mid = request.getParameter("mid");
		String[] cart_nums = request.getParameterValues("cart_num");
//		Enumeration<String> enu = request.getParameterNames();
//		while(enu.hasMoreElements()) {
//			String imsi = enu.nextElement();
//			System.out.println(imsi);
//			String[] imsi2 = request.getParameterValues(imsi);
//			for(String str : imsi2) {
//				System.out.println(str);
//			}
//		}
		MemberDTO mdto =null;
		List<CartDTO> list = null;
		if(flag.equals("cart")) {
			MemberDAO dao = MemberDAO.getInstance();
			CartDAO dao2 = CartDAO.getInstance();
			mdto=dao.getUserInfo(mid);
			list=dao2.getOrderList2(cart_nums);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("mdto", mdto);
		return "/main/orderProduct.jsp";
	}
}
