package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.mapper.ReviewMapper;
import co.yedam.vo.ReviewVO;
import co.yedam.common.DataSource;

public class MyReviewControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 로그인된 유저 ID 가져오기
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId"); // 세션 키는 프로젝트에 맞게 확인

        if (userId == null) {
            // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
            resp.sendRedirect("loginForm.do");
            return;
        }

        // 마이바티스 Mapper 불러오기
        ReviewMapper mapper = DataSource.getInstance().openSession(true).getMapper(ReviewMapper.class);

        // 나의 리뷰 목록 조회
        List<ReviewVO> myReviews = mapper.selectMyReviews(userId);

        // request에 담아서 JSP로 포워딩
        req.setAttribute("myReviews", myReviews);
        req.getRequestDispatcher("member/myReview.tiles").forward(req, resp);
    }
}
