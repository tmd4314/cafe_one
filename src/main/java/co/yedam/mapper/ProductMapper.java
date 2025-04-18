package co.yedam.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import co.yedam.vo.ProductVO;

import co.yedam.vo.ProductVO;

public interface ProductMapper {

	   List<ProductVO> searchAdvanced(@Param("keyword") String keyword, @Param("main") String main,
       @Param("sub") String sub, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);
	   ProductVO selectProduct(@Param("code") String code); // 상품 상세 조회
}
