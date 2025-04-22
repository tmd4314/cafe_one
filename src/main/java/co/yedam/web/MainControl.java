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
import co.yedam.vo.ProductVO;


public class MainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		HttpSession session = req.getSession();
//		String logId = (String) session.getAttribute("logId");
		
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        
        List<ProductVO> bestPdListCO = mapper.selectCategoryTop("CO");
        List<ProductVO> bestPdListSF = mapper.selectCategoryTop("SF");
        List<ProductVO> bestPdListPD = mapper.selectCategoryTop("PD");
        List<ProductVO> bestPdListUZ = mapper.selectCategoryTop("UZ");
        
        req.setAttribute("bCOList", bestPdListCO);
        req.setAttribute("bSFList", bestPdListSF);
        req.setAttribute("bPDList", bestPdListPD);
        req.setAttribute("bUZList", bestPdListUZ);
		req.getRequestDispatcher("product/index.tiles").forward(req, resp);
		
		// req.setAttribute("productList", productList); // JSP에 전달

	} // end of exec()
} // end of class
		

