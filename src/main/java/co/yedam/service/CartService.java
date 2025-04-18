package co.yedam.service;

import java.util.List;
import java.util.Map;

import co.yedam.vo.CartVo;

public interface CartService {
    List<CartVo> getCartList(String id);
    boolean removeCart(int cartNo);
	boolean updateCart(CartVo cvo);
}

