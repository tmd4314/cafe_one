package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
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
		
		int reviewCounter = service.getproductListWithReviewCount(reviewCode);
		
		req.setAttribute("reviewCounter", reviewCounter);
		req.setAttribute("reviewProductList", productList);
		req.getRequestDispatcher("product/index.tiles").forward(req, resp);
	} // end of exec()
} // end of class
		

