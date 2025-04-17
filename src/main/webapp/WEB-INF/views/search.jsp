<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>"${keyword}" 검색 결과</h3>

<c:if test="${empty searchList}">
  <p style="color:red;">[디버그] 검색 결과 없음</p>
</c:if>

<form action="search.do" method="get" class="mb-3 d-flex gap-2">
    <input type="text" name="keyword" value="${keyword}" placeholder="상품명" class="form-control form-control-sm w-auto" />
    <input type="text" name="minPrice" value="${minPrice}" placeholder="최소가격" class="form-control form-control-sm w-auto" />
    <input type="text" name="maxPrice" value="${maxPrice}" placeholder="최대가격" class="form-control form-control-sm w-auto" />
    <button type="submit" class="btn btn-sm btn-primary">검색</button>
</form>

<c:if test="${empty searchList}">
  <p>검색 결과가 없습니다.</p>
</c:if>

<table class="table table-bordered">
  <thead>
    <tr><th>상품명</th><th>가격</th><th>제조사</th></tr>
  </thead>
  <tbody>
    <c:forEach var="p" items="${searchList}">
      <tr>
        <td><a href="productInfo.do?code=${p.pdCode}">${p.pdName}</a></td>
        <td>${p.pdPrice}</td>
        <td>${p.manufacturer}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>