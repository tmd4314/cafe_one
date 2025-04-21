package co.yedam.service;

import java.util.List;

import co.yedam.vo.CartVo;

public interface CartService {
    List<CartVo> getCartList(String id);
    boolean removeCart(int cartNo);
	boolean updateCart(CartVo cvo);
	List<CartVo> getCash(String id, List<Integer> cartNoList);
	boolean deleteCartItem(String logId, String pdCode, int quantity);
	CartVo getCartItemByCartNo(int cartNo);
}

