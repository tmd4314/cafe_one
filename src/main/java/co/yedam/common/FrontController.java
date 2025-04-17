package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.web.AdminControl;
import co.yedam.web.CategoryListControl;
import co.yedam.web.LoginControl;
import co.yedam.web.LoginFormControl;
import co.yedam.web.MainControl;
import co.yedam.web.ProductControl;
import co.yedam.web.ProductFormControl;
import co.yedam.web.ProductListControl;
import co.yedam.web.SignUpControl;
import co.yedam.web.majorProdControl;

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
//		map.put("/majorProdList.do", new majorProdControl());
		// 베스트, 사용자 취향 기반

		// 상세화면
		map.put("/product.do", new ProductFormControl());
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		// 회원가입.
		map.put("/signForm.do", new SignUpControl()); // 회원가입화면.
		map.put("/signUp.do", new SignUpControl()); // 회원등록.

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();//
		String path = uri.substring(context.length());

		Control sub = map.get(path);
		sub.exec(req, resp);
	}
}
