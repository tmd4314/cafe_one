// OrderFormControl 클래스
package co.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    private static final int PAGE_SIZE = 5; // 페이지당 주문 수
    private static final int PAGE_GROUP_SIZE = 5; // 페이지 링크 수

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 사용자 ID 가져오기 (예시)
        String userId = (String) req.getSession().getAttribute("logId");

        // 현재 페이지 번호 가져오기
        String pageStr = req.getParameter("page");
        int currentPage = 1; // 기본값은 1페이지
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                // page 파라미터가 숫자가 아닌 경우 기본값으로 설정
                currentPage = 1;
            }
        }

        // 주문 서비스 객체 생성
        OrderService orderService = new OrderServiceImpl();

        try {
            // 총 주문 수 조회
            int totalOrders = orderService.getTotalOrdersByUserId(userId);

            // 총 페이지 수 계산
            int totalPages = (int) Math.ceil((double) totalOrders / PAGE_SIZE);

            // 시작 페이지 번호 계산
            int startPage = (currentPage - 1) / PAGE_GROUP_SIZE * PAGE_GROUP_SIZE + 1;

            // 끝 페이지 번호 계산
            int endPage = Math.min(startPage + PAGE_GROUP_SIZE - 1, totalPages);

            // 현재 페이지에 해당하는 주문 목록 가져오기
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("startRow", (currentPage - 1) * PAGE_SIZE); // startRow는 0부터 시작
            params.put("endRow", currentPage * PAGE_SIZE); // endRow 값 추가
            params.put("pageSize", PAGE_SIZE);
            List<OrderVo> orderList = orderService.getOrderListByUserId(params);

            // 각 주문에 대한 주문 상세 정보 가져오기
            OrderDetailService orderDetailService = new OrderDetailServiceImpl();
            for (OrderVo order : orderList) {
                String odNo = order.getOdNo();
                List<OrderDetailVo> orderDetails = orderDetailService.getOrderDetailsByOdNo(odNo);
                order.setOrderDetails(orderDetails); // OrderVo에 주문 상세 정보 설정
                
            }
            System.out.println(orderList);

            // 주문 목록 및 페이징 관련 정보 요청 속성에 저장
            req.setAttribute("orderList", orderList);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("startPage", startPage);
            req.setAttribute("endPage", endPage);
            req.setAttribute("totalPages", totalPages);

            // 페이지 이동
            req.getRequestDispatcher("cash/orderForm.tiles").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "주문 목록을 불러오는 데 실패했습니다.");
            req.getRequestDispatcher("cash/orderForm.tiles").forward(req, resp);
        }
    }
}
