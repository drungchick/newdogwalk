package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LoginForm implements CommandProcess {
	/* 현재 필요 없는 파일 */
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "login/loginForm";
	}

}
