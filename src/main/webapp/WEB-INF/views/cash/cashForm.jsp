<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문서 작성</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .form-control {
      height: 38px; /* 입력란 크기 줄이기 */
    }
    .mileage-container {
      display: flex;
      align-items: center;
    }
    .mileage-container input {
      margin-right: 10px;
    }
  </style>
</head>
<body>
<div class="container my-5">
  <h3 class="mb-4">📝 주문/결제</h3>

  <!-- 주문 상품 요약 -->
  <!-- <c:forEach var="cart" items="${blist }"> -->
	   <div class="card p-3 mb-4">
	     <h5>🛒 주문 상품</h5>
	     <table class="table">
	       <thead>
	         <tr>
	           <th scope="col">상품/옵션 정보</th>
	           <th scope="col">수량</th>
	           <th scope="col">상품금액</th>
	           <th scope="col">합계금액</th>
	           <th scope="col">배송비</th>
	         </tr>
	       </thead>
	       <tbody>
	         <tr>
	           <td>커피존 바날라 시럽 1000ml</td>
	           <td>1개</td>
	           <td>15,000원</td>
	           <td>15,000원</td>
	           <td>(실온5만원이상 무료배송/3,000원)</td>
	         </tr>
	       </tbody>
	     </table>
	     <p>총 1개의 상품금액: <strong>15,000원</strong></p>
	     <p>배송비: <strong>3,000원</strong></p>
	     <p>합계: <strong>18,000원</strong></p>
	   </div>
   <!-- </c:forEach> -->
  
  <form action="#" method="post">
    <!-- 배송지 정보 //-->
    <div class="card p-3 mb-4">
      <h5>배송지 정보</h5>
      <div class="col-md-6">
        <label class="form-label">이름</label>
        <input type="text" class="form-control" name="userName" value="홍길동" >
      </div>
      <div class="col-md-12">
        <label class="form-label">전화번호</label>
        <input type="text" class="form-control" name="phone" value="010-1234-5678" >
      </div>
      <div class="col-md-12">
        <label class="form-label">배송 주소</label>
        <input type="text" class="form-control" name="address" value="서울특별시 강남구" >
      </div>
    </div>

    <!-- 결제 정보 -->
    <div class="card p-3 mb-4">
      <h5>💳 결제 정보</h5>
      <div class="mileage-container">
        <label class="form-label">마일리지 사용 (보유 마일리지: 10,000원)</label>
        <input type="number" class="form-control" name="useMileage" value="0">
        <button type="button" class="btn btn-secondary btn-sm" onclick="useAllMileage()">모두 사용</button>
      </div>
      <p>총 결제 금액: <strong id="totalPrice">18,000원</strong></p>
    </div>

    <!-- 버튼 -->
    <div class="text-end">
      <button type="submit" class="btn btn-primary">주문하기</button>
      <a href="#" class="btn btn-outline-secondary">취소</a>
    </div>
  </form>
</div>

<script>
	
  function useAllMileage() {
    const availableMileage = 10000;
    document.querySelector('input[name="useMileage"]').value = availableMileage;
    updateTotalPrice();
  }

  function updateTotalPrice() {
    const productPrice = 15000; // 상품 금액
    const deliveryFee = 3000;    // 배송비
    const useMileage = parseInt(document.querySelector('input[name="useMileage"]').value) || 0;
    const totalPrice = productPrice + deliveryFee - useMileage;
    document.getElementById('totalPrice').innerText = totalPrice.toLocaleString() + '원';
  }

  document.querySelector('input[name="useMileage"]').addEventListener('input', updateTotalPrice);
</script>
</body>
</html>
    