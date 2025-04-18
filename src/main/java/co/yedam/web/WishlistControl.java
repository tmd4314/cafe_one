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

        if (userId == null) {
            resp.sendRedirect("loginForm.do");
            return;
        }

        WishlistService service = new WishlistServiceImpl();
        List<WishlistVO> list = service.getUserWishlist(userId);

        req.setAttribute("wishlist", list);
        req.getRequestDispatcher("wishlist.tiles").forward(req, resp); // 변경됨
    }
}

