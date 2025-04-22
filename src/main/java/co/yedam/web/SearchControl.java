package co.yedam.web;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.CategoryService;
import co.yedam.service.CategoryServiceImpl;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;
import co.yedam.vo.CategoryVO;
import co.yedam.vo.ProductVO;

public class SearchControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String main = req.getParameter("main");
        String sub = req.getParameter("sub");
        String minPrice = req.getParameter("minPrice");
        String maxPrice = req.getParameter("maxPrice");

        ProductService service = new ProductServiceImpl();
        List<ProductVO> list = service.searchAdvanced(keyword, main, sub, minPrice, maxPrice);
        
        CategoryService catService = new CategoryServiceImpl();
        List<CategoryVO> all = catService.getCategoryList();
        Set<String> mainCategories = all.stream()
            .map(CategoryVO::getCategoryName)
            .filter(Objects::nonNull)
            .collect(Collectors.toCollection(LinkedHashSet::new));

        req.setAttribute("searchList", list);
        req.setAttribute("keyword", keyword);
        req.setAttribute("main", main);
        req.setAttribute("sub", sub);
        req.setAttribute("minPrice", minPrice);
        req.setAttribute("maxPrice", maxPrice);
        req.setAttribute("mainCategoryList", mainCategories);
        req.setAttribute("categoryList", all);  
        
        System.out.println("검색 필터: main = " + main + ", sub = " + sub);
        req.getRequestDispatcher("search.tiles").forward(req, resp);
    }
}
