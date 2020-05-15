package main.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.MemberDAO;
import member.MemberDTO;

public class OrderProductAction22 implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		///fitness/main/orderProduct22.do?mid='+mid+"&p_num="
		//+p_num+"&pname="+p_name+"&price="+p_price+"&quantity="+document.getElementById("ibN").value
		request.setCharacterEncoding("utf-8");
		
		String mid=request.getParameter("mid");
		String p_num = request.getParameter("p_num");
		String p_name=request.getParameter("pname");
		String p_price=request.getParameter("price");
		String quantity=request.getParameter("quantity");
		System.out.println(mid + " " + p_num + " " + p_name + " " + p_price + " " + quantity);
		MemberDTO mdto =null;
		MemberDAO dao = MemberDAO.getInstance();
		mdto=dao.getUserInfo(mid);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("p_num", p_num);
		request.setAttribute("p_name", p_name);
		request.setAttribute("p_price", p_price);
		request.setAttribute("quantity", quantity);
		return "/main/orderProduct22.jsp";
	}
}
