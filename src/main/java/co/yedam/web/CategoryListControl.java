package co.yedam.web;

import java.io.IOException;
import java.util.List;
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
        List<CategoryVO> list = service.getCategoryList();

        req.setAttribute("categoryList", list);
        req.getRequestDispatcher("index.tiles").forward(req, resp);
    }
}

