package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;
import co.yedam.vo.MemberVo;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터
		String id = req.getParameter("uname");
		String pw = req.getParameter("psw");
		
		MemberService svc = new MemberServiceImpl();
		MemberVo mvo = svc.login(id, pw);
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(mvo);
		
		if(mvo == null) {
			req.setAttribute("msg", "아이디와 비밀번호를 확인하세요.");
			req.getRequestDispatcher("member/loginForm.tiles").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("logId", id); //세션객체의 attr에 저장.
			session.setAttribute("pwd", pw); //세션객체의 attr에 저장.
			session.setAttribute("userName", mvo.getUserName());
			session.setAttribute("phone", mvo.getPhone());
			session.setAttribute("addre", mvo.getAddress());
			session.setAttribute("email", mvo.getEmail());
			session.setAttribute("mile", mvo.getMailage());
			session.setAttribute("reviewId", mvo.getReviewId());
			session.setAttribute("orDNo", mvo.getOrderDetailNo());
			session.setAttribute("loginUser", mvo);
			req.getRequestDispatcher("product/index.tiles").forward(req, resp);
			resp.sendRedirect("main.do");
			
		}
	}

}
