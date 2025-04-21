package co.yedam.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.OrderDetailMapper;
import co.yedam.mapper.OrderMapper;
import co.yedam.vo.OrderVo;

public class OrderServiceImpl implements OrderService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	OrderDetailMapper dmapper = session.getMapper(OrderDetailMapper.class);
	@Override
	public boolean insertOrder(OrderVo order) {
		// TODO Auto-generated method stub
		return mapper.insertOrder(order) == 1;
	}
	@Override
	public List<OrderVo> getOrderListByUserId(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getOrderListByUserId(params);
	}
	@Override
	public OrderVo getOrder(String odNo, String userid) {
		// TODO Auto-generated method stub
		return mapper.getOrder(odNo, userid);
	}
	@Override
	public String getImpUidByOrderNo(String orderNo) {
		// TODO Auto-generated method stub
		return mapper.getImpUidByOrderNo(orderNo);
	}
	@Override
	public boolean updateOrderStatusToCancelled(String orderNo) {
		// TODO Auto-generated method stub
		return mapper.updateOrderStatusToCancelled(orderNo);
	}
	@Override
	public boolean removeOrder(String odNo) {
		boolean orderDeleted = mapper.deleteOrder(odNo);
	    boolean detailOrderDeleted = dmapper.deleteDetailOrder(odNo);

	    return orderDeleted && detailOrderDeleted; // 둘 다 성공해야 true 반환
	}
	@Override
	public int getTotalOrdersByUserId(String userId) {
		// TODO Auto-generated method stub
		return mapper.getTotalOrdersByUserId(userId);
	}
}
