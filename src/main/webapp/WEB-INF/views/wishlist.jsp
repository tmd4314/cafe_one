<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>찜한 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f4f0;
      font-family: 'Segoe UI', sans-serif;
    }
    .card-img-top {
      height: 260px;
      object-fit: contain;
      padding: 1rem;
      background-color: #f8f8f8;
    }
    .card-title {
      color: #6f4e37;
    }
    .badge-origin {
      background-color: #deb887;
      color: #fff;
      font-size: 0.75rem;
      padding: 0.3rem 0.5rem;
      border-radius: 5px;
      
   
    }
  </style>
</head>
<body>
<div class="container my-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3> 찜한 목록 리스트</h3>
    <a href="main.do" class="btn btn-outline-secondary btn-sm">← 메인으로</a>
  </div>

  <c:choose>
    <c:when test="${empty wishlist}">
      <div class="alert alert-warning">아직 찜한 목록이 없습니다!</div>
    </c:when>
    <c:otherwise>
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="item" items="${wishlist}">
          <div class="col">
            <div class="card h-100 shadow-sm">
              <img src="images/${item.pdImg}" class="card-img-top" alt="원두 이미지"
                   onerror="this.src='images/no-image.png'">
              <div class="card-body">
                <h5 class="card-title">${item.pdName}</h5>
                <p class="card-text">
                  <span class="badge-origin">${item.manufacturer}</span><br/>
                  가격: <fmt:formatNumber value="${item.pdPrice}" pattern="#,###"/> 원<br>
                  <strong class="text-danger">찜한 개수: ${item.cnt}개</strong>
                </p>
              </div>
              <div class="card-footer d-flex justify-content-between bg-transparent border-0">
                 <!-- 상세보기 버튼 -->
                <form action="product.do" method="get">
				  <input type="hidden" name="pdCode" value="${item.pdCode}" />
				  <button class="btn btn-sm btn-outline-primary" type="submit">상세보기</button>
				</form>
				<!-- 장바구니 추가 버튼 -->
				  <button class="btn btn-sm btn-outline-success add-to-cart-btn"
				          data-pdcode="${item.pdCode}" data-userid="${sessionScope.logId}">
				    🛒 장바구니
				  </button>
				<!-- 삭제 버튼 -->
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
<script>
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".add-to-cart-btn").forEach(button => {
    button.addEventListener("click", function () {
      const pdCode = this.dataset.pdcode;
      const userId = this.dataset.userid;

      fetch("addToCartAjax.do", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `pdCode=\${pdCode}&userId=\${userId}&quantity=1`
      })
      .then(res => res.text())
      .then(data => {
        if (data === "success") {
          // ✅ 장바구니 창 열기
          const cartOffcanvas = new bootstrap.Offcanvas(document.getElementById('offcanvasCart'));
          cartOffcanvas.show();

          // ✅ 장바구니 내용 불러오기
          loadCart();
        } else {
          alert("장바구니 담기에 실패했습니다.");
        }
      });
    });
  });
});

function loadCart() {
  fetch("cartListAjax.do?userId=" + '${sessionScope.logId}')
    .then(res => res.json())
    .then(data => {
      const cartItems = document.getElementById("cartItems");
      cartItems.innerHTML = "";

      let total = 0;

      data.forEach(item => {
        total += item.quantity * item.pdPrice;

        const li = document.createElement("li");
        li.className = "list-group-item d-flex justify-content-between align-items-center";

        li.innerHTML = `
          <div class="form-check">
            <input class="form-check-input cart-check" type="checkbox" value="${item.cartNo}">
          </div>
          <div>
            <strong>${item.pdName}</strong><br>
            <small>${item.quantity}개 × ${item.pdPrice.toLocaleString()}원</small>
          </div>
          <div>
            <button class="btn btn-sm btn-outline-secondary">수정</button>
          </div>
        `;
        cartItems.appendChild(li);
      });
    });
}
</script>
</body>
</html>