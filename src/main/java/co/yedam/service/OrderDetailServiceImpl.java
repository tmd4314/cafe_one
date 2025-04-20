package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.OrderDetailMapper;
import co.yedam.vo.OrderDetailVo;

public class OrderDetailServiceImpl implements OrderDetailService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderDetailMapper mapper = session.getMapper(OrderDetailMapper.class);
	@Override
	public boolean insertOrderDetail(OrderDetailVo orderDetail) {
		// TODO Auto-generated method stub
		return mapper.insertOrderDetail(orderDetail) == 1;
	}
	@Override
	public List<OrderDetailVo> getOrderDetailsByOdNo(String odn) {
		// TODO Auto-generated method stub
		return mapper.getOrderDetailsByOdNo(odn);
	}
}
