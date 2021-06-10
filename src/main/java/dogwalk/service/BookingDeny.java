package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class BookingDeny implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mbd_no = request.getParameter("mbd_no");
		String bk_no = request.getParameter("bk_no");
		String bk_mc_chk = request.getParameter("bk_mc_chk");
		String bk_chk = request.getParameter("bk_chk");
		String wkr_reg_no = request.getParameter("wkr_reg_no");
		
		Booking booking = new Booking();
		booking.setMbd_no(mbd_no);
		booking.setBk_no(bk_no);
		booking.setBk_mc_chk(bk_mc_chk);
		booking.setBk_chk(bk_chk);
		booking.setWkr_reg_no(wkr_reg_no);
		BookingDao bd = BookingDao.getInstance();
		int result = bd.deny(booking);
		request.setAttribute("result", result);
		return "booking/bookingDeny";
	}

}
