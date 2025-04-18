package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.vo.CartVo;

public class CartUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cno = req.getParameter("cno");
		String qan = req.getParameter("qan");
		
		CartVo cvo = new CartVo();
		cvo.setCartNo(Integer.parseInt(cno));
		cvo.setQuantity(Integer.parseInt(qan));
		
		CartService svc = new CartServiceImpl();
		if(svc.updateCart(cvo)) {
			// {"retCode": "OK"}
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			// {"retCode": "NG"}
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
