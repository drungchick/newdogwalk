package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MBWriteCheck implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)	{
		HttpSession session = request.getSession();
//		String mb_clf_cd = (String) session.getAttribute("mb_clf_cd");
		String own_id = (String) session.getAttribute("own_id");
		
		/* String mb_clf_cd = (String) session.getAttribute("mb_clf_cd"); */
		String mb_clf_cd = request.getParameter("mb_clf_cd"); // request 값
		
		session.setAttribute("own_id", own_id);
		session.setAttribute("mb_clf_cd", mb_clf_cd);
		
		int result = 0;
		if(mb_clf_cd.equals("1")) {
			result = 1;
		} else {
			result = 2;
		}
		request.setAttribute("result", result);
		return "mboard/confirmWrite";
	}

}
