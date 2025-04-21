package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;
import co.yedam.vo.OrderVo;

public class CancelOrderFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 세션에서 userid 가져오기
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("logId");
        
		String orderNo = req.getParameter("orderNo");
		

	    // 주문 정보를 조회하여 request에 저장 (예시)
	    OrderService orderService = new OrderServiceImpl();
	    OrderVo order = orderService.getOrder(orderNo, userid); // 주문 정보 조회 메소드 (구현 필요)
	    req.setAttribute("order", order);

	    // 취소 폼 페이지로 포워딩
	    req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
	}

}
