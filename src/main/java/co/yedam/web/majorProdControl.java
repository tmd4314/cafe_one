package co.yedam.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;

public class majorProdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		ProductService pvc = new ProductServiceImpl();
		
		List<Map<String, Object>> pvo = pvc.hintMessage(pno);
		List<Map<String, Object>> list = pvc.cheeringMessage();

		req.setAttribute("product", pvo);
		req.setAttribute("productList", list);
		req.getRequestDispatcher("product/majorProdList.tiles").forward(req, resp);
		
	} // end of exec
} // end of class
