package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.service.CommandProcess;
import member.dao.MemberDao;
import member.model.Member;

public class joinProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		Member mb = new Member();
		mb.setM_email(request.getParameter("m_email"));
		mb.setM_passwd(request.getParameter("m_passwd"));
		mb.setM_nick(request.getParameter("m_nick"));
		
		MemberDao md = MemberDao.getInstance();
		int result = md.insert(mb);
		request.setAttribute("result", result);
		
		return "/member/joinPro.jsp";
		
	}
}
