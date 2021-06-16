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
		
		BookingDao bd = BookingDao.getInstance(); // 오류나면 지워
		int bkcheck = bd.bkcheck(mbd_no, wkr_id); // 오류나면 지워
		
		if (bkcheck == 1) { // 오류나면 지워
			return "booking/checkBooking"; // 오류나면 지워
		} else { // 오류나면 지워

			Booking booking = new Booking();
			booking.setMbd_no(mbd_no);
			booking.setWkr_reg_no(wkr_reg_no);
			booking.setWkr_id(wkr_id);
	
			int result = bd.insert(booking);
			
			request.setAttribute("mbd_no",mbd_no);
			request.setAttribute("result", result);
			return "booking/wkrBookingAction";
		}
	}
}
