package co.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.CartVo;

public interface CartMapper {
	List<CartVo> selectCart(String id);
	int deleteCart(int cartNo);
	int modifyCart(CartVo cvo);
	 List<CartVo> selectCash(@Param("id") String id, @Param("cartNo") int cartNo);
}
