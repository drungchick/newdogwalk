package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.LicenseDao;
import dogwalk.dao.OwnerDao;
import dogwalk.dao.WalkerDao;
import dogwalk.model.License;
import dogwalk.model.Owner;
import dogwalk.model.Walker;

public class MypageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String mb_clf_cd = (String) session.getAttribute("mb_clf_cd");
		
		String mypage = null;
		
		if (mb_clf_cd == "1") {
			OwnerDao od = OwnerDao.getInstance();
			Owner owner = od.selectOwner(id);
			request.setAttribute("owner", owner);
			session.setAttribute("own_id", owner.getOwn_id());
			mypage = "/mypage/ownmypage";
		} else if (mb_clf_cd == "2") {
			WalkerDao wd = WalkerDao.getInstance();
			Walker walker = wd.selectWalker(id);
			request.setAttribute("walker", walker);
			session.setAttribute("wkr_id", walker.getWkr_id());
			
			LicenseDao ld = LicenseDao.getInstance();
			List<License> licenselst = ld.selectLicense(id);
			request.setAttribute("licenselst", licenselst);
			mypage = "/mypage/wkrmypage";
		}		
		
		return mypage;
	}

}
