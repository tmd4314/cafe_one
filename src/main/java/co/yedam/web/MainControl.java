package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;
import co.yedam.vo.ProductVO;


public class MainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		HttpSession session = req.getSession();
//		String logId = (String) session.getAttribute("logId");
		String reviewCode = req.getParameter("reviewCount");
		ProductService service = new ProductServiceImpl();
		List<ProductVO> allList = service.getTopReviewProductList();
		List<ProductVO> productList = allList.size() > 4 ? allList.subList(0, 4) : allList;
		System.out.println(allList);
		
//		int reviewCounter = service.getproductListWithReviewCount(reviewCode);
		
//		req.setAttribute("reviewCounter", reviewCounter);
		req.setAttribute("reviewProductList", productList);
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        
		List<ProductVO> bestPdList = mapper.selectCategoryTop("");
        List<ProductVO> bestPdListCO = mapper.selectCategoryTop("CO");
        List<ProductVO> bestPdListSF = mapper.selectCategoryTop("SF");
        List<ProductVO> bestPdListPD = mapper.selectCategoryTop("PD");
        List<ProductVO> bestPdListUZ = mapper.selectCategoryTop("UZ");
        
        req.setAttribute("bList", bestPdList);
        req.setAttribute("bCOList", bestPdListCO);
        req.setAttribute("bSFList", bestPdListSF);
        req.setAttribute("bPDList", bestPdListPD);
        req.setAttribute("bUZList", bestPdListUZ);

		req.getRequestDispatcher("product/index.tiles").forward(req, resp);
		
	} // end of exec()
} // end of class
		

