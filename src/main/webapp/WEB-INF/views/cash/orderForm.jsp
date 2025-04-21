<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .order-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item img {
            width: 80px;
            height: 80px;
            margin-right: 15px;
            border-radius: 4px;
        }

        .order-details {
            flex-grow: 1;
        }

        .order-details h3 {
            margin: 0;
            font-size: 16px;
            color: #333;
        }

        .order-details p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }

        .order-status {
            font-size: 16px;
            color: green;
            margin-bottom: 5px;
            text-align: center; /* 가운데 정렬 추가 */
        }

        .order-actions {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .order-actions button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 12px;
            margin: 5px 0;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .order-actions button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>주문 내역</h1>
       <c:forEach var="order" items="${orderList}">
            <div class="order-item">
            	<div class="order-status"><c:out value="${order.odStatus }"/></div> <!-- 주문 성공 메시지 -->
                <img src="images/${order.orderDetails[0].pdImg}" alt="상품 이미지">
                <div class="order-details">
                    <h3>주문 번호: ${order.odNo}</h3>
                    <p>상품 제목: ${order.orderDetails[0].pdName} 외 ${order.orderDetails.size()}건</p> <!-- 상품 제목 및 건수 표시 -->
                    <p>주문일자: ${order.odDate}</p>
                    <p>총 결제 금액: ${order.odTotal} 원</p>
                    <a href="orderDetailForm.do?ono=${order.odNo }">주문상세</a>
                </div>
                <div class="order-actions">
	                <button>삭제</button>
	            </div>
            </div>
        </c:forEach>
    </div>
    
</body>
</html>
