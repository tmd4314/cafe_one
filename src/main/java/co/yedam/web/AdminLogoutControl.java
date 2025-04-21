package co.yedam.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import co.yedam.common.Control;

public class AdminLogoutControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate(); // 세션 초기화
        resp.sendRedirect("adminLoginForm.jsp"); // 관리자 로그인 페이지로 이동
    }
}
