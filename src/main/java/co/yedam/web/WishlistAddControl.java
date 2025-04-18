package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.ProductServiceImpl;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;

public class WishlistAddControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId"); // 세션에서 유저 ID 가져오기
        String pdCode = req.getParameter("pdCode");

        // 값이 없을 경우 처리
        if (userId == null || pdCode == null || pdCode.isBlank()) {
            req.setAttribute("error", "찜하기에 필요한 정보가 없습니다.");
            resp.sendRedirect("main.do");
            return;
        }

        WishlistService service = new WishlistServiceImpl();
        boolean result = service.addToWishlist(userId, pdCode);

        if (result) {
            req.setAttribute("success", "찜 목록에 추가되었습니다.");
        } else {
            req.setAttribute("success", "이미 찜한 상품입니다.");
        }

        req.setAttribute("product", new ProductServiceImpl().getProduct(pdCode));
        req.getRequestDispatcher("WEB-INF/views/productInfo.jsp").forward(req, resp);
    }
}
