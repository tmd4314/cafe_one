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

public class AuthentifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (req.getMethod().equals("GET")) {
			req.getRequestDispatcher("member/passwdForm.tiles").forward(req, resp);

		} else if (req.getMethod().equals("POST")) {
			HttpSession session = req.getSession();
			String logId = (String) session.getAttribute("logId");

			MemberService svc = new MemberServiceImpl();
			MemberVO mvo = svc.getMember(logId);

			String cpw = req.getParameter("current_pw");

			if (mvo.getUser_pw().equals(cpw)) {// 비밀번호 다름.
				req.setAttribute("msg", "회원비밀번호가 다릅니다.");
				req.getRequestDispatcher("member/passwdForm.tiles").forward(req, resp);
				return;
			}

			String npw = req.getParameter("new_pw");
//			String rpw = req.getParameter("confirm_pw");
			mvo.setUser_pw(npw);

			svc.changePasswd(mvo);
			resp.sendRedirect("loginForm.do");
		}

	}

}
