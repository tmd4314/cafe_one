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
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        // 1. 사용자 ID가 없는 경우 로그인 페이지로 리다이렉트
        if (userId == null) {
            resp.sendRedirect("loginForm.do");
            return;
        }

        // 2. 서비스 객체를 통해 사용자 삭제 처리
        MemberService service = new MemberServiceImpl();
        boolean result = service.dropUser(userId);  // dropUser 메소드 호출

        // 3. 삭제 성공 시
        if (result) {
            session.invalidate();  // 세션 종료
            resp.sendRedirect("main.do");  // 메인 페이지로 리다이렉트
        } else {
            req.setAttribute("errorMsg", "회원 탈퇴에 실패했습니다.");
            req.getRequestDispatcher("member/myPage.tiles").forward(req, resp);  // 에러 메시지 전달
        }
    }
}
