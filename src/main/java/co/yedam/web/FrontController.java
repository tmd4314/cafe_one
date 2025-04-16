package co.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.Control.AuthentifyControl;
import co.yedam.Control.LoginControl;
import co.yedam.Control.LoginFormControl;
import co.yedam.Control.LogoutControl;
import co.yedam.Control.SignUpControl;
import co.yedam.common.Control;
import co.yedam.web.MainControl;
// *.do의 요청에 실행.
public class FrontController extends HttpServlet {
	// 요청url <=> 실행컨트롤.
	Map<String, Control> map;

	// 생성자.
	public FrontController() {
		map = new HashMap<String, Control>();
	}

	// init
	@Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainControl());
		// 로그인관련.
		map.put("/loginForm.do", new LoginFormControl()); // 로그인화면.
		map.put("/login.do", new LoginControl()); // 로그인처리.
		map.put("/logout.do", new LogoutControl()); // 로그아웃.
		map.put("/authentificate.do", new AuthentifyControl()); // 비밀번호변경.
		// 회원가입.
		map.put("/signForm.do", new SignUpControl()); // 회원가입화면.
		map.put("/signUp.do", new SignUpControl()); // 회원등록.
	}

	// service.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// url vs. uri
		// http://localhost:8080/BoardWeb/board.do
		String uri = req.getRequestURI();
		// System.out.println("요청 URI: " + uri); // /BoardWeb/board.do
		String context = req.getContextPath();
		String page = uri.substring(context.length()); // "/board.do"
		System.out.println(page);

		Control sub = map.get(page); // 키(url) => control 반환.
		sub.exec(req, resp);
	}
}
