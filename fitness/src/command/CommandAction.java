package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//action작성(스프링에서 control이라 한다.)
public interface CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable;
}//end interface
