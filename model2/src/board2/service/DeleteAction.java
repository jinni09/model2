package board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.dao.BoardDao;
import common.service.CommandProcess;

public class DeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		BoardDao brdd = BoardDao.getInstance();
		int result = brdd.delete(no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "/board2/delete.jsp";
	}

}