package co.yedam.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.vo.CartVo;

public class AddToCartAjaxControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String pdCode = req.getParameter("pdCode");
        String quantityStr = req.getParameter("quantity");

        System.out.println("[장바구니 요청] userId: " + userId + ", pdCode: " + pdCode + ", quantity: " + quantityStr);

        int quantity = 1;
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (Exception e) {
            quantity = 1; // fallback
        }

        CartService service = new CartServiceImpl();
        boolean success = service.addToCart(new CartVo(userId, pdCode, quantity));

        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(success ? "success" : "fail");
    }
}

