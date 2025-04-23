package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.ReviewMapper;
import co.yedam.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
	@Override
	public boolean addReview(ReviewVO vo) {
		
		return mapper.insertReview(vo) == 1;
	}

	@Override
	public List<ReviewVO> getReviewList(String pdCode) {
		
		return mapper.selectReviewList(pdCode);
	}
	
	@Override
	public boolean removeReview(int reviewId, String userId, String pdCode) {
	    return mapper.deleteReview(reviewId, userId, pdCode) == 1;
	}
	
	@Override
    public List<ReviewVO> getMyReviews(String userId) {
        return mapper.selectMyReviews(userId); // 내가 작성한 리뷰 목록을 가져옵니다.
    }
}
