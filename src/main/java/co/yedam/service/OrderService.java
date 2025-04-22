package co.yedam.service;

import java.util.List;
import java.util.Map;

import co.yedam.vo.OrderVo;

public interface OrderService {

	boolean insertOrder(OrderVo order); // 주문정보 넣기

	List<OrderVo> getOrderListByUserId(Map<String, Object> params); // 주문정보 가져오기

	OrderVo getOrder(String odNo, String userid);

	String getImpUidByOrderNo(String orderNo); // 주문정보 가져오기
	
	boolean updateOrderStatusToCancelled(String orderNo);

	boolean removeOrder(String odNo);

	int getTotalOrdersByUserId(String userId);

	

	

}
