package co.yedam.mapper;

import co.yedam.vo.ProductVO;

public interface ProductDetailMapper {

	ProductVO selectOne(String pdCode);
	
}
