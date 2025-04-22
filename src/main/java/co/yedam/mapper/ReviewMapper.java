package co.yedam.mapper;

import java.util.List;

import co.yedam.vo.ReviewVO;

public interface ReviewMapper {

	int insertReview(ReviewVO vo);
	List<ReviewVO> reviewList(String pdCode);
	public List<ReviewVO> selectReviewList(String pdCode);
	
}
