package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		int mbd_no = Integer.parseInt(request.getParameter("mbd_no"));
//		String pageNum=request.getParameter("pageNum");
//		
//		MBoardDao mbd = MBoardDao.getInstance();
//		MBoard mboard = mbd.select(mbd_no);
//		
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("mboard", mboard);
//		return "mbDeleteForm";
		return "mbDelete.do";
	}

}
