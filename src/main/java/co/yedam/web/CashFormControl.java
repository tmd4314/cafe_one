package co.yedam.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.vo.CartVo;

public class CashFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		// { "data": [ [21, '댓글내용', 'user01', '날짜'], [], []...[] ]}
		String id = req.getParameter("logId");
		String[] cnos = req.getParameterValues("cartNoList");
		
		List<Integer> cartNoList = new ArrayList<>();
        if (cnos != null) {
            for (String cno : cnos) {
                try {
                    cartNoList.add(Integer.parseInt(cno));
                } catch (NumberFormatException e) {
                    // cartNo가 숫자가 아닌 경우 에러 처리
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    resp.getWriter().write("cartNo가 올바른 숫자가 아닙니다.");
                    return;
                }
            }
        }
        System.out.println(id);
//        System.out.println(cartNoList);
        
        
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("cartNoList", cartNoList);
        
        // 세션에 logId와 cartNoList 저장
        HttpSession session = req.getSession();
        session.setAttribute("cartNoList", cartNoList);
		
		CartService svc = new CartServiceImpl();
		List<CartVo> list = svc.getCash(id, cartNoList);
		 if (cartNoList.isEmpty()) {
            // cartNoList가 비어있는 경우, 모든 장바구니 항목 조회
            list = svc.getCartList(id); // getCartList 메서드 사용
        } else {
            // cartNoList가 비어있지 않은 경우, 선택된 장바구니 항목 조회
            list = svc.getCash(id, cartNoList); // getCashList 메서드 사용
        }
		System.out.println(list);
		req.setAttribute("blist", list);
		req.getRequestDispatcher("cash/cashForm.tiles").forward(req, resp);
	}

}
