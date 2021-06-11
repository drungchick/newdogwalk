package dogwalk.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MBoard mboard = new MBoard();
		String mbd_sbjt = request.getParameter("mbd_sbjt");
		String own_id = request.getParameter("own_id");
		String mbd_cont = request.getParameter("mbd_cont");
		/* String pageNum = request.getParameter("pageNum"); */
		Date mbd_str_dt = Date.valueOf(request.getParameter("mbd_str_dt"));
		Date mbd_fn_dt = Date.valueOf(request.getParameter("mbd_fn_dt"));
		
		mboard.setMbd_sbjt(mbd_sbjt);
		mboard.setOwn_id(own_id);
		mboard.setMbd_cont(mbd_cont);
		mboard.setMbd_str_dt(mbd_str_dt);
		mboard.setMbd_fn_dt(mbd_fn_dt);
		MBoardDao mbd = MBoardDao.getInstance();
		int result = mbd.insert(mboard);
		
		request.setAttribute("result", result);
		return "mboard/mbWrite";
	}

}
