package co.yedam.web;

import java.io.IOException;
import java.time.LocalDate;
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
		
		List<ProductVO> bestCOpd = mapper.selectCategoryTop("CO");
		List<ProductVO> bestSFpd = mapper.selectCategoryTop("SF");
		List<ProductVO> bestPDpd = mapper.selectCategoryTop("PD");
		List<ProductVO> bestUZpd = mapper.selectCategoryTop("UZ");
		
		List<ProductVO> WorstCOpd = mapper.selectCategoryWorst("CO");
		List<ProductVO> WorstSFpd = mapper.selectCategoryWorst("SF");
		List<ProductVO> WorstPDpd = mapper.selectCategoryWorst("PD");
		List<ProductVO> WorstUZpd = mapper.selectCategoryWorst("UZ");
		
		List<ProductVO> newCOpd = mapper.selectCategoryNewPd("CO");
		List<ProductVO> newSFpd = mapper.selectCategoryNewPd("SF");
		List<ProductVO> newPDpd = mapper.selectCategoryNewPd("PD");
		List<ProductVO> newUZpd = mapper.selectCategoryNewPd("UZ");
		
		// LocalDate now = LocalDate.now();
		// System.out.println(now);
		
		// test code	
		for(ProductVO pd : list) {
			if(pd.getCategoryCode().toString().equals("CO") 
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
		
		req.setAttribute("listCO", listCO); // CO 카테고리 제품들
		req.setAttribute("listSF", listSF); // SF 카테고리 제품들
		req.setAttribute("listPD", listPD); // PD 카테고리 제품들
		req.setAttribute("listUZ", listUZ); // UZ 카테고리 제품들
		
		req.setAttribute("bestCOpd", bestCOpd); // CO 카테고리 top5 제품들
		req.setAttribute("bestSFpd", bestSFpd); // SF 카테고리 top5 제품들
		req.setAttribute("bestPDpd", bestPDpd); // PD 카테고리 top5 제품들
		req.setAttribute("bestUZpd", bestUZpd); // UZ 카테고리 top5 제품들		
		
		req.setAttribute("WorstCOpd", WorstCOpd); // CO 카테고리 Worst5 제품들
		req.setAttribute("WorstSFpd", WorstSFpd); // SF 카테고리 Worst5 제품들
		req.setAttribute("WorstPDpd", WorstPDpd); // PD 카테고리 Worst5 제품들
		req.setAttribute("WorstUZpd", WorstUZpd); // UZ 카테고리 Worst5 제품들	
		
		req.setAttribute("newCOpd", newCOpd); // CO 카테고리 최신10 제품들
		req.setAttribute("newSFpd", newSFpd); // SF 카테고리 최신10 제품들
		req.setAttribute("newPDpd", newPDpd); // PD 카테고리 최신10 제품들
		req.setAttribute("newUZpd", newUZpd); // UZ 카테고리 최신10 제품들	
		
		req.getRequestDispatcher("product/productList.tiles").forward(req, resp);
	} // end of exec()
}
