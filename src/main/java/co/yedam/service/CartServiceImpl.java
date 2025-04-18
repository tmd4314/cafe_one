package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.CartMapper;
import co.yedam.mapper.CategoryMapper;
import co.yedam.vo.CartVo;

public class CartServiceImpl implements CartService {

    SqlSession session = DataSource.getInstance().openSession(true);
    CartMapper mapper = session.getMapper(CartMapper.class);
	@Override
	public List<CartVo> getCartList(String id) {
		// TODO Auto-generated method stub
		return mapper.selectCart(id);
	}


}

