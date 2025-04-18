package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;
import co.yedam.service.ProductService;
import co.yedam.service.ProductServiceImpl;
import co.yedam.vo.ProductVO;

public class ProductInfoControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        ProductService service = new ProductServiceImpl();
        ProductVO product = service.getProduct(code);

        req.setAttribute("product", product);
        req.getRequestDispatcher("productInfo.tiles").forward(req, resp);
    }
}

