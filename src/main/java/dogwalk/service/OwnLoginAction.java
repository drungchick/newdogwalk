package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dogwalk.dao.OwnerDao;
import dogwalk.model.Owner;
public class OwnLoginAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String own_id = request.getParameter("own_id");
		String own_pwd = request.getParameter("own_pwd");
		OwnerDao od = OwnerDao.getInstance();
		Owner owner = od.selectOwner(own_id);
		String mb_clf_cd = "1";
		
		int result = 0;
		if (owner == null/* || owner.getOwn_del().equals("y") */) {
			result = -1;
		} else {
			String dbPass = owner.getOwn_pwd();
			if(dbPass.equals(own_pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("id", own_id);
				
				// 세션 구분을 위한 mb_clf_cd를 보내줌
				session.setAttribute("mb_clf_cd", mb_clf_cd);
				
				result = 1;
			}
		}
		request.setAttribute("result", result);
		return "login/ownlogin";
	}

}
