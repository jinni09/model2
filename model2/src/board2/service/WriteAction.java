package board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board2.dao.BoardDao;
import board2.model.Board;
import common.service.CommandProcess;
import member.dao.MemberDao;
import member.model.Member;

public class WriteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		String re = request.getParameter("re");
		
		int no = 0, ref = 0, ref_step = 0, ref_level = 0;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
			BoardDao brdd = BoardDao.getInstance();
			Board brd = brdd.select(no);
			ref = brd.getRef();
			ref_step = brd.getRef_step();
			ref_level = brd.getRef_level();
		}
		
		HttpSession session = request.getSession();
		String m_no  = (String)session.getAttribute("m_no");
		MemberDao md = MemberDao.getInstance();
		Member mb = md.select(m_no);
		request.setAttribute("mb", mb);
		
		request.setAttribute("no", no);
		request.setAttribute("ref", ref);
		request.setAttribute("ref_step", ref_step);
		request.setAttribute("ref_level", ref_level);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("re", re);
		
		return "/board2/write.jsp";
		
	}
}