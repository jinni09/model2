package board1.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board1.dao.BoardDao;
import board1.model.Board;
import common.service.CommandProcess;

public class WriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board brd = new Board();
		brd.setNo(Integer.parseInt(request.getParameter("no")));
		brd.setSubject(request.getParameter("subject"));
		brd.setContent(request.getParameter("content"));				
		brd.setIp(request.getParameter("ip"));
		brd.setM_no(Integer.parseInt(request.getParameter("m_no")));
		String pageNum = request.getParameter("pageNum");
		String ip = request.getRemoteAddr();
		brd.setIp(ip);
		BoardDao brdd = BoardDao.getInstance();
		brd = brdd.insert(brd);
		
		/*for(int i=1; i<9928; i++) {
			String str = i+"";
			brd.setSubject(request.getParameter("subject")+str);
			brd.setContent(request.getParameter("content")+str);
			brd = brdd.insert(brd);
		}*/ //게시글 9927개 만들기
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("brd", brd);
		
		return "/board1/writePro.jsp";
	}
}