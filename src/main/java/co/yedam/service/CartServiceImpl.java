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
		return mapper.selectCart(id);
	}
	@Override
	public boolean removeCart(int cartNo) {
		return mapper.deleteCart(cartNo) == 1;
	}
	@Override
	public boolean updateCart(CartVo cvo) {
		return mapper.modifyCart(cvo) == 1;
	}
	@Override
	public List<CartVo> getCash(String id, List<Integer> cartNoList) {
		return mapper.selectCashList(id, cartNoList);
	}
	@Override
	public boolean deleteCartItem(String logId, String pdCode, int quantity) {
		return mapper.deleteCartItem(logId, pdCode, quantity);
	}
	@Override
	public CartVo getCartItemByCartNo(int cartNo) {
		return mapper.getCartItemByCartNo(cartNo);
	}
	@Override
	public boolean addCart(CartVo cvo) {
		return mapper.insertCart(cvo) == 1;
	}
	@Override
	public boolean addToCart(CartVo vo) {
		 return mapper.insertOrUpdateCart(vo) >= 1;
	}
	@Override
	public CartVo getCartItem(String userId, String pdCode) {
		// TODO Auto-generated method stub
		return mapper.getCartCartNo(userId, pdCode);
	}
}

