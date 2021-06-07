package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
					
		String id = (String) session.getAttribute("id");
		
		// 세션 구분을 위한 mb_clf_cd를 가져오고 보내줌
		String mb_clf_cd = (String) session.getAttribute("mb_clf_cd");
		session.setAttribute("mb_clf_cd", mb_clf_cd);
		
		session.setAttribute("id", id);
		
		return "main/membermain";
	}

}
