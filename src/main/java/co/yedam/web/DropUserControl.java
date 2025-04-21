package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;

public class DropUserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("member/dropUser.tiles").forward(req, resp);
		
		HttpSession session = req.getSession(false);
		
		if (session == null || session.getAttribute("logId") == null) {
			// 로그인 안되어 있을 경우
			resp.sendRedirect("loginForm.do");
			return;
		}

		String userId = (String) session.getAttribute("logId");
		MemberService svc = new MemberServiceImpl();

		if (svc.removeMember(userId)) {
			// 탈퇴 성공 시 세션 초기화 후 메인 페이지로 이동
			session.invalidate();
			resp.sendRedirect("product/index.do");
		} else {
			// 탈퇴 실패 시
			req.setAttribute("mes", "회원탈퇴 처리 중 오류가 발생했습니다.");
			req.getRequestDispatcher("mypage/myInfo.tiles").forward(req, resp);
		}
	}
}
