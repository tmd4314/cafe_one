package co.yedam.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;
import co.yedam.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
    SqlSession session = DataSource.getInstance().openSession(true);
    ProductMapper mapper = session.getMapper(ProductMapper.class);

    @Override
    public List<ProductVO> searchAdvanced(String keyword, String main, String sub, String minPrice, String maxPrice) {
        return mapper.searchAdvanced(keyword, main, sub, minPrice, maxPrice);
    }

    @Override
    public ProductVO getProduct(String code) {
        return mapper.selectProduct(code);
    }

	@Override
	public boolean updateStock(String pdCode, int quantity) {
		// TODO Auto-generated method stub
		return mapper.updateStock(quantity, pdCode) == 1;
	}
	
	@Override
	public List<ProductVO> getTopReviewProductList() {
	    return mapper.selectProductOrderByReview();  // 메서드 호출이 올바른지 확인
	}

}
