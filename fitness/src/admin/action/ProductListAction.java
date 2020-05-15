package admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import product.ProductDAO;

public class ProductListAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		//variable
		int totalRecord=0;//전체 레코드 수---
		int totalPage=0;//전체 페이지 수---
		int totalBlock=0;//전체 블럭 수---
		
		int recordPerPage=15;//페이지당 레코드 수---
		int pagePerBlock=10;//블럭당 페이지 수---
		
		int currentPage = 0;//현재 페이지---
		int currentBlock=0;//현재 블럭---
		
		int startRecord=0;//현재 페이지의 첫번째---
		
		String keyField="";//
		String keyWord="";//
		
		if(request.getParameter("keyField")!=null) {
			keyField=request.getParameter("keyField");//
		}
		if(request.getParameter("keyWord")!=null) {
			keyWord=request.getParameter("keyWord");//
		}
			
		if(request.getParameter("page")!=null) {
			currentPage=Integer.parseInt(request.getParameter("page"));//
		}
		if(request.getParameter("block")!=null) {
			currentBlock=Integer.parseInt(request.getParameter("block"));//
		}
		
		startRecord=currentPage*recordPerPage;//
		
		ProductDAO dao = ProductDAO.getInstance();		
	    totalRecord = dao.getTotal(keyField, keyWord);//
	    //System.out.println(totalRecord);
	    List list = dao.getGoodList(keyField, keyWord, startRecord);
	    //0=0*15;
	    //15=1*15;
	    //30=2*15;
	    
	    totalPage=(int)(Math.ceil((double)totalRecord/recordPerPage));//
	    totalBlock=(int)(Math.ceil((double)totalPage/pagePerBlock));///
	    
	    request.setAttribute("totalRecord", totalRecord);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("totalBlock", totalBlock);
	    request.setAttribute("recordPerPage", recordPerPage);
	    request.setAttribute("pagePerBlock", pagePerBlock);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("currentBlock", currentBlock);
	    request.setAttribute("startRecord", startRecord);
	    request.setAttribute("keyField", keyField);
	    request.setAttribute("keyWord", keyWord);
	    
		request.setAttribute("list", list);
		return "/admin/productList.jsp";
	}
}
