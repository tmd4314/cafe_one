package co.yedam.service;

import java.util.List;

import co.yedam.vo.ReviewVO;

public interface ReviewService {

	public boolean addReview(ReviewVO vo);
	public List<ReviewVO> getReviewList(String pdCode);
}
