package board1.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board1.dao.BoardDao;
import common.service.CommandProcess;

public class RecommendChkAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String m_no  = (String)session.getAttribute("m_no");
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDao brdd = BoardDao.getInstance();
		int result = brdd.recoCheck(no, m_no);
		
		request.setAttribute("result", result);
		
		return "/board1/recommendChk.jsp";
	}
}