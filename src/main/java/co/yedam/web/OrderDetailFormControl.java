package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.OrderDetailService;
import co.yedam.service.OrderDetailServiceImpl;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;
import co.yedam.vo.OrderDetailVo;
import co.yedam.vo.OrderVo;

public class OrderDetailFormControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 세션에서 userid 가져오기
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("logId");
        
//        System.out.println(userid);

        // 2. userid가 null이면 로그인 페이지로 리다이렉트
        if (userid == null) {
            resp.sendRedirect("login.do"); // 로그인 페이지 URL로 변경
            return;
        }

        // 3. 주문 번호 파라미터 받기
        String odNo = req.getParameter("ono");

        // 4. 주문 상세 정보 가져오기 (OrderService 사용)
        OrderService orderService = new OrderServiceImpl();
        OrderVo order = orderService.getOrder(odNo, userid);
        
        OrderDetailService orderDetailService = new OrderDetailServiceImpl();
        List<OrderDetailVo> orderDetails = orderDetailService.getOrderDetailsByOdNo(odNo); // 주문 상세 정보 가져오기

        
        // 6. 가져온 정보를 Request 객체에 저장
        req.setAttribute("order", order);
        req.setAttribute("orderDetails", orderDetails);

        // 7. JSP 페이지로 포워딩
        req.getRequestDispatcher("cash/orderDetailForm.tiles").forward(req, resp);
    }
}
