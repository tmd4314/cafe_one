package co.yedam.mapper;

import java.util.List;

import co.yedam.vo.ReviewVO;

public interface ReviewMapper {

	List<ReviewVO> reviewList(String pdCode);
	
}
