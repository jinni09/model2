package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.service.CommandProcess;
import member.dao.MemberDao;

public class nickChkAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		String m_nick = request.getParameter("m_nick");
		String m_no = request.getParameter("m_no");
		MemberDao md = MemberDao.getInstance();
		int result = md.nickCheck(m_nick, m_no);
		request.setAttribute("result", result);
		
		return "/member/nickChk.jsp";
		
	}

}
