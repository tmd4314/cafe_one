package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductDetailMapper;
import co.yedam.mapper.ReviewMapper;
import co.yedam.vo.ProductVO;
import co.yedam.vo.ReviewVO;

public class reviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String review = req.getParameter("reviewId");
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		ReviewVO reviewVO = mapper.selectReview(review);
		req.setAttribute("review", reviewVO);
	}

}
