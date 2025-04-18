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
import co.yedam.web.CartDeleteControl;
import co.yedam.web.CartListControl;
import co.yedam.web.CartUpdateControl;
import co.yedam.web.CategoryListControl;
import co.yedam.web.LoginControl;
import co.yedam.web.LoginFormControl;
import co.yedam.web.LogoutControl;
import co.yedam.web.MainControl;
import co.yedam.web.ProductControl;
import co.yedam.web.ProductFormControl;
import co.yedam.web.ProductListControl;
import co.yedam.web.SearchControl;
import co.yedam.web.SignUpControl;
import co.yedam.web.WishlistAddControl;
import co.yedam.web.WishlistControl;
import co.yedam.web.WishlistRemoveControl;

public class FrontController extends HttpServlet {

	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		// 메인화면
		map.put("/main.do", new MainControl());

		// 상품목록
		map.put("/productList.do", new ProductListControl());
		// 상품상세.
		map.put("/productInfo.do", new ProductControl());

		// 관리자부분.
		map.put("/adminBody.do", new AdminControl());
		// 카테고리 부분.
		map.put("/categoryList.do", new CategoryListControl());
		// 베스트, 신상품, 할인상품

	//	map.put("/majorProdList.do", new majorProdControl());
		// 베스트, 사용자 취향 기반
		// 상세화면
		map.put("/product.do", new ProductFormControl());

		// 관리자부분.
		map.put("/adminBody.do", new AdminControl());
		// 카테고리 부분.
		map.put("/category.do", new CategoryListControl());
 		// 검색 부분.
 		map.put("/search.do", new SearchControl());
		// 베스트, 신상품, 할인상품
 //		map.put("/majorProdList.do", new majorProdControl());
 		// 베스트, 사용자 취향 기반
		// 상세화면
		map.put("/product.do", new ProductFormControl());

		//로그인 관련
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		
		// 회원가입.
 		map.put("/signForm.do", new SignUpControl()); // 회원가입화면.
 		map.put("/signUp.do", new SignUpControl()); // 회원등록.
		
		//주문/장바구니
		map.put("/cartList.do", new CartListControl());
		map.put("/cartDelete.do", new CartDeleteControl());
		map.put("/updateCart.do", new CartUpdateControl());
		
		//찜목록
		map.put("/wishlist.do", new WishlistControl());
		map.put("/wishlistAdd.do", new WishlistAddControl());
		map.put("/wishlistRemove.do", new WishlistRemoveControl());


	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();//
		String path = uri.substring(context.length());

		Control sub = map.get(path);
		if (sub == null) {

 	        System.out.println("해당 요청을 처리할 컨트롤러가 없습니다: " + path);
 	        resp.sendError(HttpServletResponse.SC_NOT_FOUND, "요청한 URL을 처리할 컨트롤러가 없습니다.");
 	        return;
 	    }

		
		
	    sub.exec(req, resp);
	}
}