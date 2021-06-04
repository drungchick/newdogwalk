package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MBoard mboard = new MBoard();
//		int num = Integer.parseInt(request.getParameter("num"));
		String mbd_sbjt = request.getParameter("mbd_sbjt");
		String own_id = request.getParameter("own_id");
		String mbd_cont = request.getParameter("mbd_cont");
		String pageNum = request.getParameter("pageNum");
		
//		mboard.setNum(num);
		mboard.setMbd_sbjt(mbd_sbjt);
		mboard.setOwn_id(own_id);
		mboard.setMbd_cont(mbd_cont);
		MBoardDao mbd = MBoardDao.getInstance();
		int result = mbd.insert(mboard);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "mboard/mbWrite";
	}

}
