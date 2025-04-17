package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;
import co.yedam.vo.ProductVO;

public class ProductFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pcd = req.getParameter("pcd");
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		ProductVO product = mapper.selectOne(pcd);		
		req.setAttribute("product", product);
		
		req.getRequestDispatcher("product/productForm.tiles")//
				.forward(req, resp);
	}

}
