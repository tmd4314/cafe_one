package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.OrderMapper;
import co.yedam.vo.OrderVo;

public class OrderServiceImpl implements OrderService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	@Override
	public boolean insertOrder(OrderVo order) {
		// TODO Auto-generated method stub
		return mapper.insertOrder(order) == 1;
	}
	@Override
	public List<OrderVo> getOrderListByUserId(String userId) {
		// TODO Auto-generated method stub
		return mapper.getOrderListByUserId(userId);
	}
	@Override
	public OrderVo getOrder(String odNo, String userid) {
		// TODO Auto-generated method stub
		return mapper.getOrder(odNo, userid);
	}
}
