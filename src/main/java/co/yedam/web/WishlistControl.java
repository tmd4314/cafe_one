package co.yedam.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import co.yedam.common.Control;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;
import co.yedam.vo.WishlistVO;

public class WishlistControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        // 로그인하지 않은 사용자 처리
        if (userId == null) {
            resp.sendRedirect("loginForm.do");
            return;
        }

        // 찜목록 조회
        WishlistService service = new WishlistServiceImpl();
        List<WishlistVO> list = service.getUserWishlist(userId);

        // 화면 전달용 속성 등록
        req.setAttribute("wishlist", list);

        // Tiles 뷰 호출
        req.getRequestDispatcher("wishlist.tiles").forward(req, resp);
    }
}
