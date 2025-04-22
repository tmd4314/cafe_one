package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.vo.CartVo;

public class CartAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");
        String pdCode = req.getParameter("pdCode");
        int  quan = Integer.parseInt(req.getParameter("quan"));
        
        CartService svc = new CartServiceImpl();
        CartVo existingCartItem = svc.getCartItem(userId, pdCode); // 장바구니에 해당 상품이 있는지 확인

        if (existingCartItem != null) {
            // 이미 장바구니에 있는 경우 수량 증가
            int newQuantity = existingCartItem.getQuantity() + quan;
            existingCartItem.setQuantity(newQuantity);
            if (svc.updateCart(existingCartItem)) { // updateCart 메서드를 사용하여 수량 업데이트
                resp.sendRedirect("main.do");
            } else {
                System.out.println("수량 업데이트 오류");
                resp.sendRedirect("main.do");
            }
        } else {
            // 장바구니에 없는 경우 새로 추가
            CartVo cvo = new CartVo();
            cvo.setUserId(userId);
            cvo.setPdCode(pdCode);
            cvo.setQuantity(quan);

            if (svc.addCart(cvo)) {
                resp.sendRedirect("main.do");
            } else {
                System.out.println("처리오류");
                resp.sendRedirect("main.do");
            }
        }
    }
}
