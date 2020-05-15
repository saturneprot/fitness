package main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import post.NoticeBoardDAO;
import product.ProductDAO;


/*
15개씩 보여준다고 가정
나눴을 때 몫을 올림한 만큼이 행의 개수이다
나눴을 때 나머지 만큼이 열의 개수이다.
1개	=> (1,1)
2개	=> (1,2)
3개	=> (1,3)
4개	=> (2,1)
5개	=> (2,2)
6개	=> (2,3)
7개	=> (3,1)
8개	=> (3,2)
 */
public class MainListAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//총 상품의 개수를,,, 11개로 가정해보자
		/*
		 * int count = 11; 
		 * int rows = (int)Math.ceil((double)count/3); 
		 * int cols = count - 3*(rows-1); 
		 * System.out.println(rows); 
		 * System.out.println(cols);
		 * request.setAttribute("count", count); 
		 * request.setAttribute("rows", rows);
		 * request.setAttribute("cols", cols);
		 */
		
		request.setCharacterEncoding("utf-8");
		String flag = request.getParameter("flag");
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
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String date = sdf.format(new Date());
		//System.out.println(date);
		
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
		List list = null;
		if(flag.equals("protein")) {
			ProductDAO dao = ProductDAO.getInstance();		
			totalRecord = dao.getMainTotal(keyField, keyWord, flag);//
			//System.out.println(totalRecord);
			list = dao.getMainGoodList(keyField, keyWord, startRecord, flag);
		}else if(flag.equals("notice")) {
			NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
			totalRecord = dao.getTotal(keyField, keyWord);
			list = dao.getBoardList(keyField, keyWord, startRecord);					
		}
	    //0=0*15;
	    //15=1*15;
	    //30=2*15;
		
		int rows = (int)Math.ceil((double)list.size()/3);
		int cols = list.size() - 3*(rows-1);
	    
	    totalPage=(int)(Math.ceil((double)totalRecord/recordPerPage));//
	    totalBlock=(int)(Math.ceil((double)totalPage/pagePerBlock));///
	    System.out.println("rows : " + rows);
	    request.setAttribute("rows", rows);
	    request.setAttribute("cols", cols);
	    request.setAttribute("flag", flag);
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
		/*
		 * String imsi = ""; 
		 * if(flag.equals("protein")) { 
		 * imsi="/admin/boaList.jsp";
		 * }else if(flag.equals("notice")) {
		 *  imsi="/admin/noticeList.jsp"; 
		 *  }
		 */
		//return imsi;
		
		
		return "/main/mainList.jsp";
	}
}
