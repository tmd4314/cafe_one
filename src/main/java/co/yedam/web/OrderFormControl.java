package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.OrderDetailService;
import co.yedam.service.OrderDetailServiceImpl;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;
import co.yedam.vo.OrderVo;
import co.yedam.vo.OrderDetailVo;

public class OrderFormControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 사용자 ID 가져오기 (예시)
        String userId = (String) req.getSession().getAttribute("logId");

        // 주문 서비스 객체 생성
        OrderService orderService = new OrderServiceImpl();

        // 사용자 ID에 해당하는 주문 목록 가져오기
        List<OrderVo> orderList = orderService.getOrderListByUserId(userId);

        // 각 주문에 대한 주문 상세 정보 가져오기
        OrderDetailService orderDetailService = new OrderDetailServiceImpl();
        for (OrderVo order : orderList) {
            String odNo = order.getOdNo();
            List<OrderDetailVo> orderDetails = orderDetailService.getOrderDetailsByOdNo(odNo);
            order.setOrderDetails(orderDetails); // OrderVo에 주문 상세 정보 설정
        }

        // 주문 목록 요청 속성에 저장
        req.setAttribute("orderList", orderList);

        // 페이지 이동
        req.getRequestDispatcher("cash/orderForm.tiles").forward(req, resp);
    }
}
