package co.yedam.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import co.yedam.vo.ProductVO;

import co.yedam.vo.ProductVO;

public interface ProductMapper {

	   List<ProductVO> searchAdvanced(@Param("keyword") String keyword, @Param("main") String main,
       @Param("sub") String sub, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);
	   ProductVO selectProduct(@Param("code") String code); // 상품 상세 조회
	   List<ProductVO> selectAllProduct(); // 전체상품조회 made by KMS
	   List<ProductVO> selectCategory(@Param("categoryCode") String categoryCode); // 카테고리별 상품조회 made by KMS
	   List<ProductVO> selectCategoryTop(@Param("categoryCode") String categoryCode); // 카테고리별 top5상품 made by KMS
	   List<ProductVO> selectCategoryWorst(@Param("categoryCode") String categoryCode); // 카테고리별 worst5상품 made by KMS
	   List<ProductVO> selectCategoryNewPd(@Param("categoryCode") String categoryCode); // 카테고리별 최신 5상품 made by KMS 
	   int updateStock(@Param("quantity") int quantity, @Param("pdCode") String pdCode);
	   
	   List<ProductVO> selectProductOrderByReview();

	   int productListWithReviewCount(@Param("pdCode") String code);
}
