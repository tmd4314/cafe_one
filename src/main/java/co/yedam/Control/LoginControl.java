package co.yedam.Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;
import co.yedam.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터: uname, psw
		String id = req.getParameter("uname");
		String pw = req.getParameter("psw");

		// 서비스객체 처리.
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.login(id, pw);

		if (mvo == null) {
			req.setAttribute("msg", "아이디와 비밀번호를 확인하세요.");
			req.getRequestDispatcher("WEB-INF/views/member/loginForm.jsp").forward(req, resp);
		} else {
			// 로그인성공 => 세션객체. 로그인정보저장.
			HttpSession session = req.getSession();
			session.setAttribute("logId", id); // 세션객체의 attr에 저장.
			session.setAttribute("userName", mvo.getUser_name());
			
			resp.sendRedirect("main.do");
//			if (mvo.getResponsibility().equals("Userid")) {
////				resp.sendRedirect("boardList.do");
//				req.getRequestDispatcher("etc/main.tiles").forward(req, resp);
//			} else if (mvo.getResponsibility().equals("Admin")) {
//				req.getRequestDispatcher("manager/main.tiles").forward(req, resp);
//			}
		}

	}

}
