package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.service.CommandProcess;

public class MbdeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "/member/my/mbdelete.jsp";
		
	}
}
