package co.yedam.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;
import co.yedam.vo.WishlistVO;

public class WishlistAddControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String userId = req.getParameter("userId");
        String pdCode = req.getParameter("pdCode");

        if (userId == null || pdCode == null) {
            out.print("fail");
            return;
        }

        WishlistService svc = new WishlistServiceImpl();
        WishlistVO vo = new WishlistVO();
        vo.setPdCode(pdCode);
        vo.setUserId(userId);

        if (svc.existsInWishlist(vo)) {
            out.print("exist");
        } else {
            boolean success = svc.addToWishlist(vo);
            out.print(success ? "success" : "fail");
        }
    }
}

