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
	public List<CartVo> getCash(String id, List<Integer> cartNoList) {
		// TODO Auto-generated method stub
		return mapper.selectCashList(id, cartNoList);
	}
	@Override
	public boolean deleteCartItem(String logId, String pdCode, int quantity) {
		// TODO Auto-generated method stub
		return mapper.deleteCartItem(logId, pdCode, quantity);
	}
	@Override
	public CartVo getCartItemByCartNo(int cartNo) {
		// TODO Auto-generated method stub
		return mapper.getCartItemByCartNo(cartNo);
	}
}

