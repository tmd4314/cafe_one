package co.yedam.service;

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
}
