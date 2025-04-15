<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 상품목록  -->
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach var="product" items="${blist }">
          <div class="col mb-5">
              <div class="card h-100">
                  <!-- Sale badge-->
                  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                  <!-- Product image-->
                  <a href="product.html"><img class="card-img-top" src="images/${product['PROD_IMAGE'] }" alt="..." /></a>
                  <!-- Product details-->
                  <div class="card-body p-4">
                      <div class="text-center">
                          <!-- Product name-->
                          	<h5 class="fw-bolder">
							    <a href="productInfo.do?pno=${product['PRD_CODE']}">
							        <c:out value="${product['PRD_NAME']}"/>
							    </a>
							</h5>
                           <!-- Product reviews-->
                           <div class="d-flex justify-content-center small text-warning mb-2">
                           <c:forEach var="i" begin="1" end="${product['STAR_POINT']}">
		                      <div class="bi-star-fill"></div>
		                  </c:forEach>
                  </div>
                           <!-- Product price-->
                           <span class="text-muted text-decoration-line-through"><c:out value="${product['ORIGIN_PRICE'] }원"/></span>
                           <c:out value="${product['SALE_PRICE'] }원"/>
                          
                      </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                  </div>
              </div>
          </div>
        </c:forEach>
        </div>
    </div>
</section>
       
    </body>
</html>
