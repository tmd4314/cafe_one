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
import co.yedam.vo.CategoryVO;

public class CategoryListControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryService service = new CategoryServiceImpl();
        List<CategoryVO> all = service.getCategoryList();
        Set<String> mainCategories = all.stream()
            .map(CategoryVO::getCategoryName)
            .filter(Objects::nonNull)
            .collect(Collectors.toCollection(LinkedHashSet::new)); 

        req.setAttribute("mainCategoryList", mainCategories);
        req.setAttribute("categoryList", all); 

        req.getRequestDispatcher("category.tiles").forward(req, resp);
    }
}

