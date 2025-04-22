package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductDetailMapper;
import co.yedam.mapper.ReviewMapper;
import co.yedam.service.ReviewService;
import co.yedam.service.ReviewServiceImpl;
import co.yedam.vo.ProductVO;
import co.yedam.vo.ReviewVO;

public class ProductFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pdCode = req.getParameter("pdCode");
		String userId = req.getParameter("userId");
		String title = req.getParameter("reviewTitle");
		String content = req.getParameter("reviewContent");
		
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductDetailMapper mapper = sqlSession.getMapper(ProductDetailMapper.class);
		ProductVO product = mapper.selectOne(pdCode);		
		req.setAttribute("product", product);
		
		ReviewMapper mapper1 = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> review = mapper1.reviewList(pdCode);
		req.setAttribute("review", review);
		
		req.getRequestDispatcher("product/productForm.tiles")//
				.forward(req, resp);
	}

}
