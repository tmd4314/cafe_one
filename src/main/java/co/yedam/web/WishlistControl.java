package co.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.WishlistService;
import co.yedam.service.WishlistServiceImpl;
import co.yedam.vo.WishlistVO;
 
 public class WishlistControl implements Control {
 
     @Override
     public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String userId = (String) req.getSession().getAttribute("logId");
         String pdCode = req.getParameter("pdCode");
 
         WishlistService svc = new WishlistServiceImpl();
         WishlistVO vo = new WishlistVO();
         vo.setUserId(userId);
         vo.setPdCode(pdCode);
 
         if (!svc.isInWishlist(vo)) {
             svc.addToWishlist(vo);
         }
 
         resp.sendRedirect("productInfo.do?pdCode=" + pdCode);
     }
 }
