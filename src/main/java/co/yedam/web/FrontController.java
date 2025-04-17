package co.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;

public class FrontController extends HttpServlet {

	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		// 메인화면
		map.put("/main.do", new MainControl());
		// 상품목록.

		map.put("/productList.do", new ProductListControl());
		// 상품상세.
		map.put("/productInfo.do", new ProductControl());
		// 관리자부분.
		map.put("/adminBody.do", new AdminControl());
		// 카테고리 부분.
		map.put("/categoryList.do", new CategoryListControl());
		// 베스트, 신상품, 할인상품
		map.put("/majorProdList.do", new majorProdControl());
		// 베스트, 사용자 취향 기반

		map.put("/main.do", new MainControl());
		// 상세화면
		map.put("/product.do", new ProductFormControl());

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());

		Control sub = map.get(path);
		sub.exec(req, resp);

		//
	}
}
