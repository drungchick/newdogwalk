package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class BookingAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Booking booking = new Booking();
//		HttpSession session = request.getSession();
		String mbd_no = request.getParameter("mbd_no");
		String wkr_reg = request.getParameter("wkr_reg");
		String own_id = request.getParameter("own_id");
		// 세션에서 wkr_reg_no, wkr_id 받아와서 세팅.
		
		booking.setMbd_no(mbd_no);
		booking.setWkr_reg_no(wkr_reg);
//		session.getAttribute(own_id);
		BookingDao bd = BookingDao.getInstance();
		int result = bd.insert(booking);
		
		request.setAttribute("result", result);
		return "booking/bookingAction";
	}

}
