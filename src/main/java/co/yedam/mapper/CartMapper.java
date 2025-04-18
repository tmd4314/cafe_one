package co.yedam.mapper;

import java.util.List;


import co.yedam.vo.CartVo;

public interface CartMapper {
	List<CartVo> selectCart(String id);
	int deleteCart(int cartNo);
	int modifyCart(CartVo cvo);
}
