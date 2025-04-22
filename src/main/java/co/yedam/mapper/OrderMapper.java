package co.yedam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.OrderVo;

public interface OrderMapper {
	int insertOrder(OrderVo order);

	List<OrderVo> getOrderListByUserId(Map<String, Object> params);

	OrderVo getOrder(@Param("odNo") String odNo, @Param("userid") String userid);
	
	String getImpUidByOrderNo(@Param("odNo") String odNo);

	boolean updateOrderStatusToCancelled(@Param("odNo") String odNo);

	boolean deleteOrder(@Param("odNo")String odNo);

	int getTotalOrdersByUserId(@Param("userId")String userId);
}
