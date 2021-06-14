package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class WkrBookingAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
		String mbd_no = request.getParameter("mbd_no");
		String wkr_reg_no = request.getParameter("wkr_reg_no");
		String wkr_id = request.getParameter("wkr_id");
		// 세션에서 wkr_reg_no, wkr_id 받아와서 세팅.
		
		Booking booking = new Booking();
		booking.setMbd_no(mbd_no);
		booking.setWkr_reg_no(wkr_reg_no);
		booking.setWkr_id(wkr_id);
//		session.getAttribute(own_id);
		
	
		BookingDao bd = BookingDao.getInstance();
		int result = bd.insert(booking);
		
		request.setAttribute("mbd_no",mbd_no);
		request.setAttribute("result", result);
		return "booking/wkrBookingAction";
	}

}
