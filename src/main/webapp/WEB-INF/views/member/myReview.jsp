<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>나의 상품 후기</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 20px;
    }
    .review-container {
      width: 800px;
      margin: 0 auto;
    }
    .review-card {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 12px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.03);
      position: relative;
      
      margin-left: 600px;
      margin-right: 600px;
    }
    .review-header {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }
    .review-header img {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      margin-right: 10px;
    }
    .review-header .user {
      font-weight: bold;
      color: #333;
    }
    .review-title {
      font-weight: bold;
      font-size: 16px;
      color: #333;
      margin: 10px 0;
    }
    .review-date {
  font-size: 13px; 
  color: #999;           
}
    .review-text {
      font-size: 15px;
      color: #333;
      line-height: 1.6;
      margin-top: 10px;
    }
    .review-footer {
      display: flex;
      align-items: center;
      justify-content: flex-end;
      margin-top: 20px;
      font-size: 13px;
      color: #888;
    }
  </style>
</head>
<body>
  <c:forEach var="r" items="${myReviews}">
    <div class="review-card">
      <div class="review-header">
        <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="user" />
        <div class="user">${r.userId}</div>
      </div>
      <div class="review-date">
        <div><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd" /></div>
      </div>
  <div class="review-title">
    ${r.reviewTitle}
  </div>
      <div class="review-text">
        ${r.reviewContent}
      </div>
      <div class="review-footer">
        <button class="btn btn-danger" onclick="deleteReview(${r.reviewId}, '${r.pdCode}')">삭제</button>
      </div>
    </div>
</c:forEach>
<script>
  function deleteReview(reviewId, pdCode) {
    if (confirm("정말 이 리뷰를 삭제하시겠습니까?")) {
      location.href = 'deleteReview.do?reviewId=' + reviewId + '&pdCode=' + encodeURIComponent(pdCode);
    }
  }
</script>
</body>
</html>