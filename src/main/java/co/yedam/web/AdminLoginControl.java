package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.AdminService;
import co.yedam.service.AdminServiceImpl;
import co.yedam.vo.AdminVO;

public class AdminLoginControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("adminId");
        String pw = req.getParameter("adminPw");

        AdminService service = new AdminServiceImpl();
        AdminVO admin = service.login(id, pw);

        if (admin != null) {
            HttpSession session = req.getSession();
            session.setAttribute("adminId", admin.getAdminId());
            session.setAttribute("adminName", admin.getAdminName());
            resp.sendRedirect("adminBody.do");
        } else {
            req.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            req.getRequestDispatcher("adminLoginForm.jsp").forward(req, resp);
        }
    }
}
