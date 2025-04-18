package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.dao.ProductListDAO;
import co.yedam.vo.ProductVO;

public class AllProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductListDAO dao = new ProductListDAO();
		List<ProductVO> products = dao.AllProductList();
		
		req.setAttribute("products", products);
		
		req.getRequestDispatcher("index.tiles").forward(req, resp);
	}

}
