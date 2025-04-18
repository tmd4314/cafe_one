package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.CartMapper;
import co.yedam.vo.CartVo;

public class CartServiceImpl implements CartService {

    SqlSession session = DataSource.getInstance().openSession(true);
    CartMapper mapper = session.getMapper(CartMapper.class);
	@Override
	public List<CartVo> getCartList(String id) {
		// TODO Auto-generated method stub
		return mapper.selectCart(id);
	}
	@Override
	public boolean removeCart(int cartNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCart(cartNo) == 1;
	}
	@Override
	public boolean updateCart(CartVo cvo) {
		// TODO Auto-generated method stub
		return mapper.modifyCart(cvo) == 1;
	}
	@Override
	public List<CartVo> getCash(String id, int cartNo) {
		System.out.println(id);
		System.out.println(cartNo);
		// TODO Auto-generated method stub
		return mapper.selectCash(id, cartNo);
	}


}

