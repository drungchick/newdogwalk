package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class OwnMainAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String own_id = (String) session.getAttribute("own_id");
		
		session.setAttribute("own_id", own_id);
		
		return "main/ownmain";
	}

}
