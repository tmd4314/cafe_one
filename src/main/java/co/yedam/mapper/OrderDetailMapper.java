package co.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.OrderDetailVo;

public interface OrderDetailMapper {
	int insertOrderDetail(OrderDetailVo orderDetail);
	List<OrderDetailVo> getOrderDetailsByOdNo(String odn);
	boolean deleteDetailOrder(@Param("odNo") String odNo);
}
