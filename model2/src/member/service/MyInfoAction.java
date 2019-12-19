package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.CommandProcess;
import member.dao.MemberDao;
import member.model.Member;

public class MyInfoAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_no  = (String)session.getAttribute("m_no");
		MemberDao md = MemberDao.getInstance();
		Member mb = md.infoselect(m_no);
		request.setAttribute("mb", mb);
		
		return "/member/my/myinfo.jsp";
	}

}
