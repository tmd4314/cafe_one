package co.yedam.service;

import java.util.List;

import co.yedam.vo.ReviewVO;

public interface ReviewService {

	public boolean addReview(ReviewVO vo);
	public List<ReviewVO> getReviewList(String pdCode);
	
	public boolean removeReview(int reviewId, String userId);

    // 내가 작성한 리뷰 목록
    public List<ReviewVO> getMyReviews(String userId);
}
