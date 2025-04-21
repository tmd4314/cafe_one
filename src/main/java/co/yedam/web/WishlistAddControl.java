package co.yedam.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import co.yedam.common.Control;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;
import co.yedam.vo.WishlistVO;

public class WishlistAddControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = (String) req.getSession().getAttribute("logId");
        String pdCode = req.getParameter("pdCode");

        if (userId == null || pdCode == null) {
            resp.sendRedirect("loginForm.do");
            return;
        }

        WishlistService svc = new WishlistServiceImpl();
        WishlistVO vo = new WishlistVO();
        vo.setUserId(userId);
        vo.setPdCode(pdCode);

        System.out.println("찜 추가 요청 - userId: " + userId + ", pdCode: " + pdCode);
        System.out.println("VO 세팅 - " + vo.getUserId() + " / " + vo.getPdCode());

        if (!svc.isInWishlist(vo)) {
            svc.addToWishlist(vo);
        }

        resp.sendRedirect("productInfo.do?pdCode=" + pdCode);
    }
}
