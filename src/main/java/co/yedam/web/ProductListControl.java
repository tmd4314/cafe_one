package co.yedam.web;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;
import co.yedam.vo.ProductVO;


public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		
		String cc = req.getParameter("category");
		//String cc = "SF1";
		
		// 해당 카테고리 전체 상품
		List<ProductVO> list = mapper.selectCategory(cc); 		
		List<ProductVO> bestPdList = mapper.selectCategoryTop(cc);
		List<ProductVO> worstPdList = mapper.selectCategoryWorst(cc);
		List<ProductVO> newPdList = mapper.selectCategoryNewPd(cc);
		
		req.setAttribute("list", list); // CO 카테고리 제품들
		req.setAttribute("bestPdList", bestPdList); // SF 카테고리 제품들
		req.setAttribute("worstPdList", worstPdList); // PD 카테고리 제품들
		req.setAttribute("newPdList", newPdList); // UZ 카테고리 제품들
		
		
		req.getRequestDispatcher("product/productList.tiles").forward(req, resp);
	} // end of exec()
}
