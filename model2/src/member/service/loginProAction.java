package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.CommandProcess;
import member.dao.MemberDao;
import member.model.Member;

public class loginProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		Member mb = new Member();
		HttpSession session = request.getSession();
		mb.setM_email(request.getParameter("m_email"));
		mb.setM_passwd(request.getParameter("m_passwd"));		
		
		MemberDao md = MemberDao.getInstance();
		int result = md.loginChk(mb.getM_email(), mb.getM_passwd());
		
		if(result > 0 ) {
			session.setAttribute("m_no", result+"");
		}
		
		request.setAttribute("result", result);
		
		return "/member/loginPro.jsp";
		
	}
}
