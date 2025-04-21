<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 취소</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h2>주문 취소</h2>
        <hr>

        <c:if test="${not empty requestScope.errorMsg}">
            <div class="alert alert-danger" role="alert">
                ${requestScope.errorMsg}
            </div>
        </c:if>

        <c:if test="${not empty requestScope.successMsg}">
            <div class="alert alert-success" role="alert">
                ${requestScope.successMsg}
            </div>
        </c:if>

        <form action="cancelOrder.do" method="post">
            <div class="mb-3">
                <label for="orderNo" class="form-label">주문 번호:</label>
                <input type="text" class="form-control" id="orderNo" name="orderNo" value="${param.orderNo}" readonly>
            </div>
            <div class="mb-3">
                <label for="cancelReason" class="form-label">취소 사유:</label>
                <textarea class="form-control" id="cancelReason" name="cancelReason" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-danger">주문 취소 요청</button>
            <a href="orderList.do" class="btn btn-secondary">주문 목록으로 돌아가기</a>
        </form>
    </div>
</body>
</html>