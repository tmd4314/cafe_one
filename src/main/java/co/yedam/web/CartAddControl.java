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
        String userid = (String) session.getAttribute("logId");
        String pdCode = req.getParameter("pdCode");
        String quan = req.getParameter("quan");
        
        CartVo cvo = new CartVo();
        cvo.setPdCode(pdCode);
        cvo.setQuantity(Integer.parseInt(quan));
        cvo.setUserId(userid);
		

		// 업무처리.
		CartService svc = new CartServiceImpl();
		if (svc.addCart(cvo)) {
			 resp.sendRedirect("main.do");
		} else {
			System.out.println("처리오류");
			req.getRequestDispatcher("member/signForm.tiles").forward(req, resp);
		}

	}

}
