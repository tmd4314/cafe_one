package co.yedam.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.service.OrderDetailService;
import co.yedam.service.OrderDetailServiceImpl;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;
import co.yedam.vo.CartVo;
import co.yedam.vo.OrderDetailVo;
import co.yedam.vo.OrderVo;

public class CashControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // 요청 문자 인코딩 설정
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String impUid = req.getParameter("imp_uid");
        String odn = req.getParameter("merchant_uid"); // od_no 대신 merchantUid 사용
        int price = Integer.parseInt(req.getParameter("totalPr"));
        int totalPrice = Integer.parseInt(req.getParameter("orderPr"));
        String ren = req.getParameter("buyerName");
        String reph = req.getParameter("buyerTel");
        int defee = Integer.parseInt(req.getParameter("deliveryFee")); //배송비
        String readdr = req.getParameter("buyerAddr");
        //String buyerPostcode = req.getParameter("buyerPostcode"); 우편번호
        String logId = req.getParameter("logId"); // user_id로 사용
        String odStatus = "주문성공";
        int umile = Integer.parseInt(req.getParameter("useMileage"));
        
        System.out.println("impUid: " + impUid);
        System.out.println("odn: " + odn);
        System.out.println("price: " + price);
        System.out.println("totalPrice: " + totalPrice);
        System.out.println("ren: " + ren);
        System.out.println("reph: " + reph);
        System.out.println("defee: " + defee);
        System.out.println("readdr: " + readdr);
        System.out.println("logId: " + logId);
        System.out.println("odStatus: " + odStatus);
        System.out.println("umile: " + umile);

        try {
            // Order 정보 생성 및 설정
            OrderVo order = new OrderVo();
            order.setPaymentUid(impUid);
            order.setOdNo(odn); // merchantUid를 odNo로 사용
            order.setOdStatus(odStatus);
            order.setPrice(price);
            order.setOdTotal(totalPrice);
            order.setUseMali(umile);
            order.setReName(ren);
            order.setRePhone(reph);
            order.setReAddr(readdr);
            order.setDelFee(defee);
            order.setUserId(logId); // logId를 userId로 사용
            
            

            // Order 정보 DB에 저장
            OrderService ovc = new OrderServiceImpl();
            ovc.insertOrder(order);

            
            // **주문 상세 정보 생성 및 저장**
            CartService svc = new CartServiceImpl();
            String[] cartNos = req.getParameter("cartNos").split(",");
            

            OrderDetailService odv = new OrderDetailServiceImpl();
            for (String cartNoStr : cartNos) {
            	int cartNo = Integer.parseInt(cartNoStr);
            	CartVo cartItem = svc.getCartItemByCartNo(cartNo); // 장바구니 목록 가져오기
            	
                OrderDetailVo orderDetail = new OrderDetailVo();
                orderDetail.setOdNo(odn); // 주문 번호 설정
                orderDetail.setPdCode(cartItem.getPdCode()); // 상품 코드 설정
                orderDetail.setQuantity(cartItem.getQuantity()); // 수량 설정

                odv.insertOrderDetail(orderDetail); // 주문 상세 정보 저장
            }

            // 주문 상세 정보 가져오기 (odNo 사용)
            List<OrderDetailVo> orderDetails = odv.getOrderDetailsByOdNo(odn);

            // 장바구니 제거 및 재고 감소
            for (OrderDetailVo detail : orderDetails) {
                String pdCode = detail.getPdCode();
                System.out.println(pdCode);
                int quantity = detail.getQuantity();

                // 장바구니 제거
                svc.deleteCartItem(logId, pdCode, quantity);

                // 재고 감소
                ProductService pvc = new ProductServiceImpl();
                pvc.updateStock(pdCode, -quantity); // 재고 감소이므로 음수 값 전달
            }

            resp.sendRedirect("main.do");

        } catch (Exception e) {
            String errorMessage = "오류 발생: " + e.getMessage();
            System.err.println(errorMessage);
            out.println("<p style='color:red'>" + errorMessage + "</p>");
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
