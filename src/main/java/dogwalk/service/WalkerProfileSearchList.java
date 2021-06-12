package dogwalk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.WalkerDao;
import dogwalk.model.Walker;

public class WalkerProfileSearchList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 9;
		int pagePerBlock = 5;
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		WalkerDao wd = WalkerDao.getInstance();
		List<Walker> list = wd.searchlist(startRow, endRow, type, search);
		int tot = wd.total();
		int total = tot - startRow + 1;
		int startPage = currentPage - (currentPage - 1) % 5;
		int endPage = startPage + pagePerBlock - 1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) {
			endPage = totPage;
		}
		String[] tt = {"ID","Rearing Period","Grade"};
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("type", type);
		request.setAttribute("search", search);
		request.setAttribute("tt", tt);
		
		return "profile/walkerProfileSearchList";
	}
}
