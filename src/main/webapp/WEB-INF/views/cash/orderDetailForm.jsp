<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세 정보</title>
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

        h2 {
            text-align: center;
            color: #333;
        }

        .order-info {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .order-info p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }

        .order-items {
            margin-bottom: 20px;
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

        .delivery-info, .payment-info {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .delivery-info h2, .payment-info h2 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .delivery-info p, .payment-info p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🧾주문 상세 정보</h1>

        <div class="order-info">
            <p><b>주문번호:</b> ${order.odNo}</p>
            <p><b>주문일자:</b> ${order.odDate}</p>
            <p><b>주문상태:</b> ${order.odStatus}</p>
        </div>

        <div class="order-items">
            <c:forEach var="orderDetail" items="${orderDetails}">
                <div class="order-item">
                    <img src="images/${orderDetail.pdImg }" alt="상품 이미지">
                    <div class="order-details">
                        <h3>${orderDetail.pdName}</h3>
                        <p>수량: ${orderDetail.quantity}</p>
                        <p>${orderDetail.pdPrice} 원</p>
                        
                        <button class="btn btn-sm btn-primary">리뷰쓰기</button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="delivery-info">
            <h2>배송 정보</h2>
            <p><b>수령인:</b> ${order.reName}</p>
            <p><b>주소:</b> ${order.reAddr}</p>
            <p><b>연락처:</b> ${order.rePhone}</p>
        </div>

        <div class="payment-info">
            <h2>결제 정보</h2>
            <p><b>상품금액:</b> <fmt:formatNumber value="${order.odPrice}" pattern="#,###" />원</p>
			<p><b>사용 마일리지:</b> <fmt:formatNumber value="${order.useMali}" pattern="#,###" />포인트</p>
			<p><b>총 결제 금액:</b> <fmt:formatNumber value="${order.odTotal}" pattern="#,###" />원</p>
        </div>
       
         <div class="cancel-button-container">
             <c:if test="${order.odStatus != '주문취소'}">
                 <button class="btn btn-sm btn-danger" onclick="goToCancelForm('${order.odNo}')">주문취소</button>
             </c:if>
         </div>
         
    </div>
    
    <script>
    function goToCancelForm(orderNo) {
        location.href = "cancelOrderForm.do?orderNo=" + orderNo;
    }
</script>
</body>
</html>