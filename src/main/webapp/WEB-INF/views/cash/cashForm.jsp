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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container my-5">
  <h3 class="mb-4">📝 주문/결제</h3>

  <!-- 주문 상품 요약 -->
  
   <div class="card p-3 mb-4">
     <h5>🛒 주문 상품</h5>
     <table class="table">
       <thead>
         <tr>
           <th scope="col">이미지</th>
           <th scope="col">상품/옵션 정보</th>
           <th scope="col">수량</th>
           <th scope="col">상품금액</th>
           <th scope="col">합계금액</th>
           <th scope="col">배송비</th>
         </tr>
       </thead>
       <tbody>
       <c:forEach var="cart" items="${blist }"> 
         <tr>
           <td>
               <img src="images/${cart.pdImg}" alt="${cart.pdName}" style="width: 50px; height: 50px;">
           </td>
           <td><c:out value="${cart.pdName }"/></td>
           <td><c:out value="${cart.quantity }"/>개</td>
           <td><fmt:formatNumber value="${cart.pdPrice }" pattern="#,###"/>원</td>
           <td><fmt:formatNumber value="${cart.totalPrice }" pattern="#,###"/>원</td>
           <td>(실온5만원이상 무료배송/3,000원)</td>
         </tr>
         <!-- cartNo를 hidden input으로 추가 -->
         <input type="hidden" name="cartNos" value="${cart.cartNo}">
         </c:forEach>
       </tbody>
     </table>
     <c:set var="totalProductPrice" value="0" />
     <c:set var="deliveryFee" value="3000" />

     <c:forEach var="cart" items="${blist }">
         <c:set var="totalProductPrice" value="${totalProductPrice + cart.totalPrice}" />
     </c:forEach>

     <p>총 상품금액: <strong><fmt:formatNumber value="${totalProductPrice}" pattern="#,###"/>원</strong></p>
     <p>배송비: <strong><fmt:formatNumber value="${deliveryFee}" pattern="#,###"/>원</strong></p>
     <p>합계: <strong><fmt:formatNumber value="${totalProductPrice + deliveryFee}" pattern="#,###"/>원</strong></p>
 </div>
   
  
  <form action="cash.do" method="post" id="paymentForm">
  <!-- hidden input 추가 -->
  <input type="hidden" name="logId" id="logId">
  <input type="hidden" name="deliveryFee" id="deliveryFee" value="${deliveryFee}">
  <input type="hidden" name="totalPr" id="totalPr">
  <input type="hidden" name="orderPr" id="orderPr">
  <input type="hidden" name="imp_uid" id="imp_uid">
  <input type="hidden" name="merchant_uid" id="merchant_uid">
  <input type="hidden" name="buyerName" id="buyerName">
  <input type="hidden" name="buyerTel" id="buyerTel">
  <input type="hidden" name="buyerAddr" id="buyerAddr">
  <input type="hidden" name="buyerPostcode" id="buyerPostcode">
    <!-- 배송지 정보 //-->
    <div class="card p-3 mb-4">
      <h5>배송지 정보</h5>
      <div class="col-md-6">
        <label class="dname">이름</label>
        <input type="text" class="form-control" name="dname"id="dname">
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="fillMemberInfo()">회원정보 넣기</button>
      </div>
      <div class="col-md-12">
        <label class="dphone">전화번호</label>
        <input type="text" class="form-control" name="dphone" id="dphone">
      </div>
      
      <div class="col-md-12">
	        <label class="dpost">우편번호</label>
	         <input type="text" class="form-control" name="dpost" id="sample6_postcode" placeholder="우편번호">
	         <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: #007bff; color: white; border: 1px solid #007bff;">
	      </div>
      
      <div class="col-md-12">
        <label class="daddre">배송 주소</label>
        <input type="text" class="form-control" name="daddre" id="sample6_address">
        <input type="text" class="form-control" name="daddre2" id="sample6_detailAddress" placeholder="상세주소">
      </div>
    </div>

    <!-- 결제 정보 -->
    <div class="card p-3 mb-4">
      <h5>💳 결제 정보</h5>
      <div class="mileage-container">
        <label class="form-label">마일리지 사용 (보유 마일리지: <c:out value="${sessionScope.mile }"/>)</label>
        <input type="number" class="form-control" name="useMileage" value="0">
        <button type="button" class="btn btn-secondary btn-sm" onclick="useAllMileage()">모두 사용</button>
      </div>
      <p>총 결제 금액: <strong id="totalPriceResult"></strong></p>
    </div>

    <!-- 버튼 -->
    <div class="text-end">
      <button type="button" class="btn btn-primary" onclick="requestPay()">주문하기</button>
      <a href="main.do" class="btn btn-outline-secondary">취소</a>
    </div>
  </form>
</div>
  
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.1.js"></script>
  <script>
  function fillMemberInfo() {
      // 세션에 저장된 회원 정보를 가져와서 해당 필드에 채워 넣음
      document.getElementById('dname').value = '${sessionScope.userName}';
      document.getElementById('dphone').value = '${sessionScope.phone}';
      document.getElementById('sample6_postcode').value = '${sessionScope.post1}';
      document.getElementById('sample6_address').value = '${sessionScope.addre1} ${sessionScope.addre2}';
      document.getElementById('sample6_detailAddress').value = '${sessionScope.addre3}';

  }

  function sample6_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우에는 공백('')값을 가지므로, 임의로 가공하지 않아도 된다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') {
                  // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else {
                  // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 주소에 추가한다.
                  addr += extraAddr;
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById('sample6_address').value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById('sample6_detailAddress').focus();
          }
      }).open();
  }

  function useAllMileage() {
    const availableMileage = '${sessionScope.mile}';
    document.querySelector('input[name="useMileage"]').value = availableMileage;
    uptopr();
  }

  function uptopr() {
    const totalPr = ${totalProductPrice + deliveryFee}; // 총합계 금액
    const useMileage = parseInt(document.querySelector('input[name="useMileage"]').value) || 0;
    const orderPr = totalPr - useMileage;
    console.log(totalPr);
    document.getElementById('totalPriceResult').innerText = orderPr.toLocaleString() + '원';

    //hidden input 필드에 값 설정
    document.getElementById('totalPr').value = totalPr;
    document.getElementById('orderPr').value = orderPr;
  }

  document.querySelector('input[name="useMileage"]').addEventListener('input', uptopr);

  function requestPay() {
    // 상품 이름 통합
    let productName = "${blist[0].pdName}" + " 외 " + "${blist.size() - 1}" + "건";
    if ("${blist.size()}" == "1") {
        productName = "${blist[0].pdName}";
    }
    uptopr();
    const amount = parseInt(document.getElementById('totalPriceResult').innerText.replace(/[^0-9]/g, '')); // '원' 제거 후 숫자 변환

    // 결제 API 연동 코드 (아임포트 예시)
    IMP.init('imp30074182'); // 아임포트 ID
    IMP.request_pay({
        pg: 'html5_inicis.INIBillTst', // PG사 선택
        pay_method: 'card', // 결제 방법
        merchant_uid: 'merchant_' + new Date().getTime(), // 주문 번호
        name: productName, // 상품 이름 (통합)
        amount: 1,//amount, // 결제 금액
        buyer_email: '${sessionScope.email}', // 구매자 이메일
        buyer_name: document.getElementById('dname').value, // 구매자 이름
        buyer_tel: document.getElementById('dphone').value, // 구매자 전화번호
        buyer_addr: document.getElementById('sample6_address').value + " " + document.getElementById('sample6_detailAddress').value, // 구매자 주소
        buyer_postcode: document.getElementById('sample6_postcode').value // 구매자 우편번호
    }, function (rsp) {
        if (rsp.success) {
            // 결제 성공 시 로직
            console.log(rsp);
            // hidden input 필드에 값 설정
            document.getElementById('imp_uid').value = rsp.imp_uid;
            document.getElementById('merchant_uid').value = rsp.merchant_uid;
            document.getElementById('buyerName').value = document.getElementById('dname').value;
            document.getElementById('buyerTel').value = document.getElementById('dphone').value;
            document.getElementById('buyerAddr').value = document.getElementById('sample6_address').value + " " + document.getElementById('sample6_detailAddress').value;
            document.getElementById('buyerPostcode').value = document.getElementById('sample6_postcode').value;
            document.getElementById('logId').value = '${sessionScope.logId }'; // 추가됨

         // cartNos 값을 hidden input 필드에 추가
            const cartNos = document.querySelectorAll('input[name="cartNos"]');
            let cartNosValues = [];
            cartNos.forEach(cartNo => {
                cartNosValues.push(cartNo.value);
            });
            console.log("cartNosValues: " + cartNosValues); // cartNos 값 확인

            // cartNosValues를 hidden input 필드에 설정 (쉼표로 구분된 문자열)
            const cartNosInput = document.createElement('input');
            cartNosInput.setAttribute('type', 'hidden');
            cartNosInput.setAttribute('name', 'cartNos');
            cartNosInput.setAttribute('value', cartNosValues.join(',')); // 배열을 쉼표로 구분된 문자열로 변환
            document.getElementById('paymentForm').appendChild(cartNosInput);

            // 폼 제출 전에 값 확인 (디버깅용)
            console.log("imp_uid: " + document.getElementById('imp_uid').value);
            console.log("merchant_uid: " + document.getElementById('merchant_uid').value);
            console.log("buyerName: " + document.getElementById('buyerName').value);
            console.log("buyerTel: " + document.getElementById('buyerTel').value);
            console.log("buyerAddr: " + document.getElementById('buyerAddr').value);
            console.log("buyerPostcode: " + document.getElementById('buyerPostcode').value);
            console.log("logId: " + document.getElementById('logId').value); // 추가됨
            console.log("cartNos: " + document.querySelector('input[name="cartNos"]').value); // cartNos 값 확인


            // 폼 제출
            document.getElementById('paymentForm').submit();
        } else {
            // 결제 실패 시 로직
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }
  </script>
</body>
</html>

