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
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        System.out.println(" [WishlistControl] 로그인된 유저: " + userId);

        if (userId == null) {
            System.out.println(" [WishlistControl] 세션이 만료되었거나 로그인 정보 없음.");
            resp.sendRedirect("loginForm.do");
            return;
        }

        WishlistService service = new WishlistServiceImpl();
        List<WishlistVO> list = service.getUserWishlist(userId);

        System.out.println(" [WishlistControl] 찜 목록 개수: " + list.size());
        for (WishlistVO vo : list) {
            System.out.println(" - " + vo.getPdCode() + " / " + vo.getPdName());
        }

        req.setAttribute("wishlist", list);
        req.getRequestDispatcher("wishlist.tiles").forward(req, resp);
    }
}
