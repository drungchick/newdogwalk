package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int mbd_no = Integer.parseInt(request.getParameter("mbd_no"));
		MBoardDao mbd = MBoardDao.getInstance();
		MBoard mboard = mbd.select(mbd_no);
		int result = mbd.readCountUpdate(mbd_no);
		request.setAttribute("mboard", mboard);
		return "mboard/mbView";
	}

}
