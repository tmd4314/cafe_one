package co.yedam.filter;
 
 import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import co.yedam.service.CategoryService;
import co.yedam.service.CategoryServiceImpl;
import co.yedam.vo.CategoryVO;
 
 @WebFilter("/*")
 public class CategoryInitFilter implements Filter {
     private CategoryService service = new CategoryServiceImpl();
 
     public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
             throws IOException, ServletException {
         HttpServletRequest req = (HttpServletRequest) request;
 
         if (req.getAttribute("categoryList") == null) {
             List<CategoryVO> all = service.getCategoryList();
             Set<String> mainList = all.stream()
                 .map(CategoryVO::getCategoryName)
                 .collect(Collectors.toCollection(LinkedHashSet::new));
             req.setAttribute("mainCategoryList", mainList);
             req.setAttribute("categoryList", all);
             
         }
 
         chain.doFilter(request, response);
     }
 }