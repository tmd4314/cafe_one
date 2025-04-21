package co.yedam.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import co.yedam.common.Control;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;
import co.yedam.vo.WishlistVO;

public class WishlistRemoveControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String pdCode = req.getParameter("pdCode");

        WishlistVO vo = new WishlistVO();
        vo.setUserId(userId);
        vo.setPdCode(pdCode);

        WishlistService svc = new WishlistServiceImpl();
        svc.removeFromWishlist(vo);

        resp.sendRedirect("wishlist.do");
    }
}
