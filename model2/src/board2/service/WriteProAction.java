package board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.dao.BoardDao;
import board2.model.Board;
import common.service.CommandProcess;

public class WriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board brd = new Board();
		brd.setNo(Integer.parseInt(request.getParameter("no")));
		brd.setSubject(request.getParameter("subject"));
		brd.setContent(request.getParameter("content"));				
		brd.setIp(request.getParameter("ip"));
		brd.setRef(Integer.parseInt(request.getParameter("ref")));
		brd.setRef_step(Integer.parseInt(request.getParameter("ref_step")));
		brd.setRef_level(Integer.parseInt(request.getParameter("ref_level")));
		brd.setM_no(Integer.parseInt(request.getParameter("m_no")));
		String pageNum = request.getParameter("pageNum");
		String ip = request.getRemoteAddr();
		brd.setIp(ip);
		BoardDao brdd = BoardDao.getInstance();
		brd = brdd.insert(brd);
		
		/*for(int i=1; i<1005; i++) {
			String str = i+"";
			brd.setRef(i);
			brd.setRef_step(-1);
			brd.setRef_level(-1);
			brd.setSubject(request.getParameter("subject")+str);
			brd.setContent(request.getParameter("content")+str);
			brd = brdd.insert(brd);
		}*/ //게시글 9927개 만들기
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("brd", brd);
		
		return "/board2/writePro.jsp";
	}
}