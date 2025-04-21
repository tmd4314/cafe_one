package co.yedam.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.Control;
import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;
import co.yedam.vo.ProductVO;


public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		List<ProductVO> list = mapper.selectAllProduct();
		List<ProductVO> listCO = new ArrayList<>();
		List<ProductVO> listSF = new ArrayList<>();
		List<ProductVO> listPD = new ArrayList<>();
		List<ProductVO> listUZ = new ArrayList<>();
		
		// test code
		for(ProductVO pd : list) {
			if(pd.getCategoryCode().toString().equals("CO1") 
					|| pd.getCategoryCode().toString().equals("CO2")
					|| pd.getCategoryCode().toString().equals("CO3")) {
				listCO.add(pd);
			} else if (pd.getCategoryCode().toString().equals("SF1") 
					|| pd.getCategoryCode().toString().equals("SF2")
					|| pd.getCategoryCode().toString().equals("SF3")
					|| pd.getCategoryCode().toString().equals("SF4")) {
				listSF.add(pd);
			} else if (pd.getCategoryCode().toString().equals("PD1") 
					|| pd.getCategoryCode().toString().equals("PD2")
					|| pd.getCategoryCode().toString().equals("PD3")) {
				listPD.add(pd);
			} else if (pd.getCategoryCode().toString().equals("UZ1") 
					|| pd.getCategoryCode().toString().equals("UZ2")
					|| pd.getCategoryCode().toString().equals("UZ3")) {
				listUZ.add(pd);
			}
		} // end of loop
		req.setAttribute("listCO", listCO);
		req.setAttribute("listSF", listSF);
		req.setAttribute("listPD", listPD);
		req.setAttribute("listUZ", listUZ);
		
		req.getRequestDispatcher("product/productList.tiles").forward(req, resp);
	} // end of exec()
}
