package board1.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.CommandProcess;
import member.dao.MemberDao;
import member.model.Member;

public class WriteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");

		HttpSession session = request.getSession();
		String m_no  = (String)session.getAttribute("m_no");
		MemberDao md = MemberDao.getInstance();
		Member mb = md.select(m_no);
		request.setAttribute("mb", mb);
		
		request.setAttribute("no", 0);
		request.setAttribute("pageNum", pageNum);
		
		return "/board1/write.jsp";
		
	}
}