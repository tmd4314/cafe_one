package co.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.ReviewVO;

public interface ReviewMapper {

	int insertReview(ReviewVO vo);
	List<ReviewVO> reviewList(String pdCode);
	public List<ReviewVO> selectReviewList(String pdCode);
	int deleteReview(@Param("reviewId") int reviewId, @Param("userId") String userId);
	List<ReviewVO> selectMyReviews(String userId); // 내가작성한 리뷰목록만 출력
}
