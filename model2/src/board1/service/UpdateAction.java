package board1.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board1.dao.BoardDao;
import board1.model.Board;
import common.service.CommandProcess;

public class UpdateAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int no = Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		BoardDao brdd = BoardDao.getInstance();
		Board brd = brdd.select(no);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("brd", brd);
	
		return "/board1/update.jsp";
		
	}
}