package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.service.CommandProcess;

public class loginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		return "/member/login.jsp";
		
	}
}