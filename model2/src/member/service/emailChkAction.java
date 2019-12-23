package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.service.CommandProcess;
import member.dao.MemberDao;

public class emailChkAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String m_email = request.getParameter("m_email");
		MemberDao md = MemberDao.getInstance();
		int result = md.emailCheck(m_email);
		request.setAttribute("result", result);
		request.setAttribute("m_email", m_email);

		return "/member/emailChk.jsp";
		
	}
}
