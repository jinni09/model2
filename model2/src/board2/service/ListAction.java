package board2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.dao.BoardDao;
import board2.model.Board;
import common.service.CommandProcess;

public class ListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao brdd = BoardDao.getInstance();

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("null") || pageNum.equals(""))
			pageNum = "1";
		
		String searchType = request.getParameter("searchType");
		String searchTxt = request.getParameter("searchTxt");
		if(searchType == null || searchType.equals("null") || searchType.equals("")){
			searchType = "all";
		}
		if(searchTxt == null || searchTxt.equals("null")){
			searchTxt = "";
		}
		
		int rowPerPage = 10;
		int pagePerBlock = 10;
		int nowPage = Integer.parseInt(pageNum);
		int total = brdd.selectTotal(searchType, searchTxt);
		int totalPage = (int) Math.ceil((double)total/rowPerPage);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int totalBlk = (int) Math.ceil((double)totalPage/pagePerBlock);
		int startPage = (nowPage - 1) / 10 * 10 + 1;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		total = total - startRow + 1;
		
		List<Board> list = brdd.selectList(startRow, endRow, searchType, searchTxt);
		
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalBlk", totalBlk);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchTxt", searchTxt);

		return "/board2/list.jsp";
	}
}