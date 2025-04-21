package co.yedam.mapper;

import java.util.List;

import co.yedam.vo.OrderDetailVo;

public interface OrderDetailMapper {
	int insertOrderDetail(OrderDetailVo orderDetail);
	List<OrderDetailVo> getOrderDetailsByOdNo(String odn);
}
