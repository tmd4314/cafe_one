package co.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.CartVo;

public interface CartMapper {
	List<CartVo> selectCart(String id);
	int deleteCart(int cartNo);
	int modifyCart(CartVo cvo);
	List<CartVo> selectCashList(@Param("id") String id, @Param("cartNoList") List<Integer> cartNoList);
	boolean deleteCartItem(@Param("userId") String userId, @Param("pdCode") String pdCode, @Param("quantity") int quantity);
	CartVo getCartItemByCartNo(int cartNo);
	int insertCart(CartVo cvo); 
	
	// 🆕 장바구니에 동일 상품이 있으면 수량 증가, 없으면 삽입
    int insertOrUpdateCart(CartVo vo);
	
}
