package admin.action;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;

public class ModifyProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ProductDAO dao = ProductDAO.getInstance();
		String str=dao.modifyProduct(request);
		//System.out.println("HIHIHIHIHI");
		StringTokenizer token = new StringTokenizer(str,"|");
		//System.out.println(token);
		String check=token.nextToken();
		if(check.equals("100")) {
			request.setAttribute("block", token.nextToken());
			request.setAttribute("page", token.nextToken());
		}else if(check.equals("200")) {
			request.setAttribute("keyField", token.nextToken());
			request.setAttribute("keyWord", token.nextToken());
			request.setAttribute("block", token.nextToken());
			request.setAttribute("page", token.nextToken());
		}
		
		//System.out.println(".................");
		
		return "/admin/productList.do";
	}
}
