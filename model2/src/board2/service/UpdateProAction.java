package board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.dao.BoardDao;
import board2.model.Board;
import common.service.CommandProcess;

public class UpdateProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String pageNum = request.getParameter("pageNum");
		
		BoardDao brdd = BoardDao.getInstance();
		Board brd = new Board();
		
		brd.setNo(Integer.parseInt(request.getParameter("no")));
		brd.setSubject(request.getParameter("subject"));
		brd.setContent(request.getParameter("content"));
		
		int result = brdd.update(brd);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("brd", brd);
		
		return "/board2/updatePro.jsp";
		
	}
}
