<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>찜한 상품 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .card-img-top {
      height: 200px;
      object-fit: cover;
    }
  </style>
</head>
<body>

<div class="container my-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3>찜한 상품 목록</h3>
    <a href="main.do" class="btn btn-outline-secondary btn-sm">← 메인으로</a>
  </div>

  <c:choose>
    <c:when test="${empty wishlist}">
      <div class="alert alert-info">찜한 상품이 없습니다.</div>
    </c:when>
    <c:otherwise>
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="item" items="${wishlist}">
          <div class="col">
            <div class="card h-100">
              <img src="images/${item.pdImg}" class="card-img-top" alt="상품 이미지"
     			onerror="this.src='images/no-image.png'">
              <div class="card-body">
                <h5 class="card-title">${item.pdName}</h5>
                <p class="card-text">
                  제조사: ${item.manufacturer}<br/>
                  가격: <fmt:formatNumber value="${item.pdPrice}" pattern="#,###"/>원
                </p>
              </div>
              <div class="card-footer d-flex justify-content-between">
                <form action="productInfo.do" method="get">
                  <input type="hidden" name="pdCode" value="${item.pdCode}" />
                  <button class="btn btn-sm btn-outline-primary" type="submit">상세보기</button>
                </form>
                <form action="wishlistRemove.do" method="post"
                      onsubmit="return confirm('정말 삭제하시겠습니까?')">
                  <input type="hidden" name="userId" value="${sessionScope.logId}" />
                  <input type="hidden" name="pdCode" value="${item.pdCode}" />
                  <button class="btn btn-sm btn-outline-danger" type="submit">✕ 삭제</button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
<c:out value="${wishlist}" />
