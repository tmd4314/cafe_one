package co.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.OrderVo;

public interface OrderMapper {
	int insertOrder(OrderVo order);

	List<OrderVo> getOrderListByUserId(String userId);

	OrderVo getOrder(@Param("odNo") String odNo, @Param("userid") String userid);
}
