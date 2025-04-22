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
import co.yedam.vo.ReviewVO;

public class AddReviewControl implements Control {

	@Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        MemberVo loginUser = (MemberVo) session.getAttribute("loginUser");

        String pdCode1 = req.getParameter("pdCode");
        
        if (loginUser == null) {
        	
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다.');");
            out.println("location.href='product.do?pdCode=" + pdCode1 + "';");
            out.println("</script>");
            out.close();
            return;
        	
//            req.setAttribute("msg", "로그인이 필요합니다.");
//            req.getRequestDispatcher("member/loginForm.tiles").forward(req, resp);
//            return;
        }

        String pdCode = req.getParameter("pdCode");
        String title = req.getParameter("reviewTitle");
        String content = req.getParameter("reviewContent");
        String userId = loginUser.getUserId(); 

        // VO에 담기
        ReviewVO vo = new ReviewVO();
        vo.setPdCode(pdCode);
        vo.setUserId(userId);
        vo.setReviewTitle(title);
        vo.setReviewContent(content);

        // 서비스 호출
        ReviewService svc = new ReviewServiceImpl();
        boolean result = svc.addReview(vo);

        if (result) {
        	
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>");
            out.println("alert('리뷰가 작성되었습니다.');");
            out.println("location.href='product.do?pdCode=" + pdCode + "#reviews';");
            out.println("</script>");
            out.close();
        	
//        	resp.sendRedirect("product.do?pdCode=" + pdCode);
        } else {
            req.setAttribute("error", "리뷰 등록에 실패했습니다.");
            req.getRequestDispatcher("view/error.jsp").forward(req, resp);
        }
    }

}
