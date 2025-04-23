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
		
//		System.out.println(id);
//		System.out.println(pw);
//		System.out.println(mvo);
		System.out.println(mvo);
		if(mvo == null) {
			resp.setContentType("text/html;charset=utf-8");
			resp.getWriter().print("<script>alert('id와 pw를 확인해주세요');"
					+ "location.href='loginForm.do';"
					+ "</script>");
			//req.getRequestDispatcher("member/loginForm.tiles").forward(req, resp);
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("logId", id); //세션객체의 attr에 저장.
			session.setAttribute("pwd", pw); //세션객체의 attr에 저장.
			session.setAttribute("userName", mvo.getUserName());
			session.setAttribute("phone", mvo.getPhone());
			session.setAttribute("post1", mvo.getPost());
			session.setAttribute("addre1", mvo.getAddress1());
			session.setAttribute("addre2", mvo.getAddress2());
			session.setAttribute("addre3", mvo.getAddress3());
			session.setAttribute("email", mvo.getEmail());
			session.setAttribute("mile", mvo.getMailage());
			session.setAttribute("loginUser", mvo);
			resp.setContentType("text/html;charset=utf-8");
			resp.getWriter().print("<script>alert('로그인 성공!!');"
					+ "location.href='main.do';"
					+ "</script>");
		} // end of if
	} // end of exec()
} // end of class
