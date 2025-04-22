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
		
        ProductService service = new ProductServiceImpl();
        List<ProductVO> allList = service.getTopReviewProductList();

        // 4개만 자르기
        List<ProductVO> productList = allList.size() > 4 ? allList.subList(0, 4) : allList;

        req.setAttribute("productList", productList); // JSP에 전달
		
		req.getRequestDispatcher("product/index.tiles").forward(req, resp);

	} // end of exec()
} // end of class
		

