package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.CartMapper;
import co.yedam.vo.OrderDetailVo;

public interface OrderDetailService {
	 SqlSession session = DataSource.getInstance().openSession(true);
	 CartMapper mapper = session.getMapper(CartMapper.class);
	 boolean insertOrderDetail(OrderDetailVo orderDetail);
	 List<OrderDetailVo> getOrderDetailsByOdNo(String odn);
}
