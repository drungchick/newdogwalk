//package dogwalk.service;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import dogwalk.dao.OwnerDao;
//import dogwalk.dao.WalkerDao;
//import dogwalk.model.Owner;
//import dogwalk.model.Walker;
//public class LoginAction implements CommandProcess {
//	/* 현재 필요 없는 파일 */
//	@Override
//	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		String own_id = request.getParameter("own_id");
//		String own_pwd = request.getParameter("own_pwd");
//		String wkr_id = request.getParameter("wkr_id");
//		String wkr_pwd = request.getParameter("wkr_pwd");
//		String mb_clf_cd = request.getParameter("mb_clf_cd");
//		OwnerDao od = OwnerDao.getInstance();
//		WalkerDao wd = WalkerDao.getInstance();
//		Walker walker = wd.selectAll(wkr_id);
//		Owner owner = od.selectAll(own_id);
//		int result = 0;
//		if(mb_clf_cd == "1") {
//			
//		}
//		if(owner == null || owner.getOwn_del().equals("y")) {
//			result = -1;
//		} else {
//			String dbPass = owner.getOwn_pwd();
//			if(dbPass.equals(own_pwd)) {
//				HttpSession session = request.getSession();
//				session.setAttribute("own_id", own_id);
//				result = 1;
//			}
//		}
//		request.setAttribute("result", result);
//		return "login/login";
//	}
//
//}
