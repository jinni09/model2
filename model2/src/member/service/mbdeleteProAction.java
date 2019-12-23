package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.CommandProcess;
import member.dao.MemberDao;

public class mbdeleteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		HttpSession session = request.getSession();
		String m_no = (String) session.getAttribute("m_no");
		String m_passwd = request.getParameter("m_passwd");

		MemberDao md = MemberDao.getInstance();
		int chk = md.passwdChk(m_no, m_passwd);
		if (chk == 1) {
			result = md.delete(Integer.parseInt(m_no));
			request.setAttribute("result", result);
		}
		request.setAttribute("result", result);
		
		return "/member/my/mbdeletePro.jsp";

	}
}