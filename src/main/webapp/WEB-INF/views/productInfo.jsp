<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		body {
            color: black !important;
            background: transparent !important;
            background-image: none !important;
        }
	</style>
</head>
 <body>
 <h2 class="my-4"> ${product.pdName}</h2>
 
 <table class="table table-striped">
   <tr><th>제품코드</th><td>${product.pdCode}</td></tr>
   <tr><th>제조사</th><td>${product.manufacturer}</td></tr>
   <tr><th>원산지</th><td>${product.pdCoo}</td></tr>
   <tr><th>재질</th><td>${product.material}</td></tr>
   <tr><th>가격</th><td>${product.pdPrice}원</td></tr>
   <tr><th>재고</th><td>${product.pdStock}개</td></tr>
   <tr><th>제조일</th><td>${product.pdMfd}</td></tr>
   <tr><th>유통기한</th><td>${product.pdExp}</td></tr>
   <tr><th>평점</th><td>${product.pdScore}</td></tr>
   <tr><th>카테고리</th><td>${product.categoryCode}</td></tr>
 </table>
 
 
  <!--찜 완료 메시지 -->
  <c:if test="${not empty success}">
   <div class="alert alert-success mt-2">${success}</div>
 </c:if>
  <!-- 찜하기 버튼 -->
  <form action="wishlistAdd.do" method="post">
    <input type="hidden" name="pdCode" value="${product.pdCode}" />
    <button type="submit" class="btn btn-outline-danger">찜하기</button>
  </form>

 
 <a href="search.do" class="btn btn-secondary mt-3">← 목록으로 돌아가기</a>
 </body>
</html>