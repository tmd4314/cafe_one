package co.yedam.service;

import java.util.List;

import co.yedam.vo.OrderVo;

public interface OrderService {

	boolean insertOrder(OrderVo order); // 주문정보 넣기

	List<OrderVo> getOrderListByUserId(String userId); // 주문정보 가져오기

	OrderVo getOrder(String odNo, String userid);

}
