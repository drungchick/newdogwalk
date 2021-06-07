package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class WkrMainAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String wkr_id = (String) session.getAttribute("wkr_id");
		
		session.setAttribute("wkr_id", wkr_id);
		
		return "main/wkrmain";
	}

}
