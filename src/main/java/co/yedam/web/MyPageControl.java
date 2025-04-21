package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
	     String userId = (String) session.getAttribute("logId");
		
	     // 2. 사용자 ID가 없는 경우 로그인 페이지로 리다이렉트 또는 에러 처리
	        if (userId == null) {
	            resp.sendRedirect("loginForm.do"); // 예시: 로그인 페이지로 리다이렉트
	            return;
	        }

	        // 3. OrderService 객체 생성
	        OrderService orderService = new OrderServiceImpl();

	        try {
	            // 4. 주문 횟수 조회
	            int orderCount = orderService.getTotalOrdersByUserId(userId);

	            // 5. 요청 속성에 주문 횟수 저장
	            req.setAttribute("orderCount", orderCount);

	            // 6. 마이페이지로 포워드
	            req.getRequestDispatcher("member/myPage.tiles").forward(req, resp);

	        } catch (Exception e) {
	            e.printStackTrace();
	            req.setAttribute("errorMsg", "주문 횟수를 불러오는 데 실패했습니다.");
	            req.getRequestDispatcher("member/myPage.tiles").forward(req, resp);
	        }
	}
}
