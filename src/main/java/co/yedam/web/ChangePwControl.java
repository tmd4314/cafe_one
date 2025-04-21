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

public class ChangePwControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("GET")) {
			req.getRequestDispatcher("member/changePw.tiles").forward(req, resp);

		} else if (req.getMethod().equals("POST")) {
			HttpSession session = req.getSession();
			String logId = (String) session.getAttribute("logId");

			MemberService svc = new MemberServiceImpl();
			MemberVo mvo = svc.getMember(logId);

			String cpw = req.getParameter("mypass");
			String npw = req.getParameter("newpass");
			String ncpw = req.getParameter("newcpass");

			if (!mvo.getPassword().equals(cpw)) {
		        req.setAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
		        req.getRequestDispatcher("member/changePw.tiles").forward(req, resp);
		        return;
		    }

		    if (!npw.equals(ncpw)) {
		        req.setAttribute("msg1", "새 비밀번호가 일치하지 않습니다.");
		        req.getRequestDispatcher("member/changePw.tiles").forward(req, resp);
		        return;
		    }

		    // 비밀번호 변경 처리
		    mvo.setPassword(npw);
		    boolean isUpdated = svc.changePasswd(mvo);

		    if (isUpdated) {
		        req.setAttribute("msg2", "비밀번호가 성공적으로 변경되었습니다.");
		    } else {
		        req.setAttribute("msg", "비밀번호 변경 중 오류가 발생했습니다.");
		    }

		    req.getRequestDispatcher("member/myPage.tiles").forward(req, resp);
		}
	}
}
