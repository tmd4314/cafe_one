package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;

public class CartDeleteControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cno = req.getParameter("cno");

        // 쉼표로 구분된 cart id들을 처리
        String[] cnoArray = cno.split(",");
        CartService svc = new CartServiceImpl();
        boolean allSuccess = true; // 모든 삭제가 성공했는지 확인하기 위한 변수

        for (String cnoStr : cnoArray) {
            try {
                int cartId = Integer.parseInt(cnoStr.trim()); // 공백 제거 후 정수로 변환
                if (!svc.removeCart(cartId)) {
                    allSuccess = false; // 삭제 실패 시 false로 설정
                    break; // 하나라도 실패하면 루프 종료 (선택 사항)
                }
            } catch (NumberFormatException e) {
                // 숫자 변환 실패 시 오류 처리
                System.err.println("잘못된 숫자 형식: " + cnoStr);
                allSuccess = false; // 변환 실패 시 false로 설정
                break; // 변환 실패 시 루프 종료 (선택 사항)
            }
        }

        // 결과 반환
        if (allSuccess) {
            resp.getWriter().print("{\"retCode\": \"OK\"}");
        } else {
            resp.getWriter().print("{\"retCode\": \"NG\"}");
        }
    }
}
