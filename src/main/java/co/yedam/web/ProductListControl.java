package co.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Control;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;
import co.yedam.vo.ProductVO;

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		// TODO Auto-generated method stub
		ProductService svc = new ProductServiceImpl();
		List<Map<String, Object>> list = svc.cheeringMessage();
		req.setAttribute("blist", list);
		req.getRequestDispatcher("product/productList.tiles").forward(req, resp);
		
		
	}

}
