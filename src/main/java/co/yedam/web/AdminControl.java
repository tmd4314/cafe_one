package co.yedam.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Control;

public class AdminControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(" AdminControl 실행됨"); 
        req.getRequestDispatcher("admin/body.tiles").forward(req, resp);
    }
}
