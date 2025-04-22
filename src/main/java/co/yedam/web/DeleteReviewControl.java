package co.yedam.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.ReviewService;
import co.yedam.service.ReviewServiceImpl;
import co.yedam.vo.MemberVo;

public class DeleteReviewControl implements Control{
	
	@Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        MemberVo loginUser = (MemberVo) session.getAttribute("loginUser");
        String pdCode = req.getParameter("pdCode"); // 상품코드
        String reviewId = req.getParameter("reviewId"); // 리뷰 ID

        if (loginUser == null) {
            // 로그인 안 된 경우
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다.');");
            out.println("location.href='product.do?pdCode=" + pdCode + "';");
            out.println("</script>");
            out.close();
            return;
        }

        String userId = loginUser.getUserId();

        // 서비스 호출
        ReviewService svc = new ReviewServiceImpl();
        boolean result = svc.removeReview(Integer.parseInt(reviewId), userId);

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        if (result) {
            out.println("alert('리뷰가 삭제되었습니다.');");
        } else {
            out.println("alert('삭제 권한이 없습니다.');");
        }
        out.println("location.href='product.do?pdCode=" + pdCode + "';");
        out.println("</script>");
        out.close();
    }
}

