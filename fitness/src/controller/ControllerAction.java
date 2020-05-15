package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

//controller는 서블릿으로 만든다.
public class ControllerAction extends HttpServlet{
	private Map<String,CommandAction> map=new HashMap<>();//변수 객체생성
	
	//init() 초기화 작업
	public void init(ServletConfig config) throws ServletException {
		String path=config.getServletContext().getRealPath("/");//
		//System.out.println(path);
		String pros=path+config.getInitParameter("proFile");//WEB-INF/CommandPro.properties
		Properties pp=new Properties();
		
		FileInputStream fn=null;
		try {
			fn=new FileInputStream(pros);
			pp.load(fn);//propertified
			
			
		}catch(IOException e) {
			System.out.println("파일 읽기 에러 : " + e);
		}finally {
			try {
				fn.close();
			} catch (IOException e2) {}
		}
		
		Iterator keys=pp.keySet().iterator();
		
		while(keys.hasNext()) {//자료가 있는동안 반복수행
			// /ch19/list.do=ch19.action.ListAction등등을 가져오는 작업이다.
			String kkey=(String)keys.next(); // /ch19/list.do
			String className=pp.getProperty(kkey);// ch19.action.ListAction
			
			try {
				Class commandClass=Class.forName(className);//클래스로 만들고
				CommandAction commandObject=(CommandAction)commandClass.newInstance();//객체를 만든다.
				map.put(kkey,commandObject);//map.put(key,value)
			}catch(Exception e) {				
				System.out.println("property 파일 내용을 클래스 객체로 만드는 동안 예외 발생 : " + e);
			}
		}//end while
	}//end init() method;
	
	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		reqPro(request,response);
	}//end doGet() method;
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		reqPro(request,response);
	}//end doPost() method;
	
	//사용자 정의 메서드
	private void reqPro(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		String view="";//JSP넣을 변수
		
		CommandAction commandAction=null;//Action들을 넣을 변수
		try {
			String uri = request.getRequestURI();// /프로젝트이름/ch19/list.do
			if(uri.indexOf(request.getContextPath())==0) {
				uri = uri.substring(request.getContextPath().length());// /ch19/list.do
			}//path
			commandAction=map.get(uri);
			view=commandAction.requestPro(request, response);//메서드를 호출하여 view를 얻는다.
			//list.jsp가 view로 넘어온다.
		}catch(Throwable e) {
			throw new ServletException(e);//예외 생성;
		}//end catch
		
		//view로 포워딩 작업
		RequestDispatcher rd=request.getRequestDispatcher(view);
		rd.forward(request, response);//view(list.jsp)로 포워딩한다.
	}//end reqPro() method;
}//end class
