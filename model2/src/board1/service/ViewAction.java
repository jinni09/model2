package board1.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board1.dao.BoardDao;
import board1.model.Board;
import common.service.CommandProcess;

public class ViewAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String m_no = (String)session.getAttribute("m_no");
		int no = Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		BoardDao brdd = BoardDao.getInstance();
		Board brd = brdd.select(no);
		brdd.updateHit(no);
		int recommend = brdd.selectRecommend(no, m_no);

		request.setAttribute("m_no", m_no);
		request.setAttribute("no", no);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("brd", brd);
		request.setAttribute("recommend", recommend);
		
		return "/board1/view.jsp";
		
	}
}