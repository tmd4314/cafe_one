package co.yedam.service;

import java.util.List;
import java.util.Map;

import co.yedam.vo.ProductVO;

public interface ProductService {
	 List<ProductVO> searchAdvanced(String keyword, String main, String sub, String minPrice, String maxPrice);
     ProductVO getProduct(String code);
	 boolean updateStock(String pdCode, int quantity);
	 
	 List<ProductVO> getProductList();
	 List<ProductVO> getTopReviewProductList();
}
