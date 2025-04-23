<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>

<html lang="ko">

<head>

	<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Orani E-Shop</title>

	<!-- Latest compiled and minified CSS -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- Google Font -->

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">

    <!-- Theme Stylesheet -->

    <link rel="stylesheet" href="css/detailstyle.css">

    <link rel="stylesheet" href="css/responsive.css">
	 <style>
        .qt {
            color: black !important;
            text-align: center;
        }
        body {
        	color: black !important; /* 글자색을 검정색으로 설정 */
		    background: transparent !important; /* 배경을 투명하게 설정 */
		    background-image: none !important; /* 배경 이미지 제거 */
		}
		/* 필요한 경우 특정 요소에 대한 글자색을 재정의할 수 있습니다. */
		h1, h2, h3, h4, h5, h6 {
		    color: black !important; /* 제목 글자색을 검정색으로 설정 */
		}
		
		p, div, span, a, li {
		    color: black !important; /* 일반 텍스트, div, span, 링크, 목록 항목 글자색을 검정색으로 설정 */
		}
		
		a {
		    color: black !important; /* 링크 글자색을 검정색으로 설정 */
		}
		
		a:hover {
		    color: darkgray !important; /* 마우스 오버 시 링크 글자색을 어두운 회색으로 설정 */
		}
        
    </style>
</head>

<body>

    <div class="short-description">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                   <div class="col-md-10 col-sm-10 col-xs-10">

                       <div class="thumb-main-image">
				        <a href="">
				            <c:choose>
				                <c:when test="${product.pdStock == 0}">
				                    <img src="images/soldout.jpg" alt="SOLD OUT">
				                </c:when>
				                <c:otherwise>
				                    <img src="images/${product.pdimg}" alt="">
				                </c:otherwise>
				            </c:choose>
				        </a>
				    </div>

                   </div>
                       
                </div>

                <div class="col-md-6">

                    <h1 class="product-title">${product.pdName }</h1>

                    <div class="ratings">

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <span class="vote-count">35 vote</span>

                    </div>

                    <div class="product-info">

                        <span class="product-id"><span class="strong-text">Product ID: <span>${product.pdCode }</span></span></span>

                        

                        <span class="product-avilability"><span class="strong-text">Availability:</span> In Stock</span>

                    </div>

                    <p class="short-info">고급스러운 산미가 기분좋게 느껴지는 스타일의 로스팅 원두</p>

                    <div class="price">

                        <span id="calculatedPrice"><fmt:formatNumber value="${product.pdPrice}" type="number" groupingUsed="true" />원</span>

                    </div>

                    <form action="cartAdd.do" class="purchase-form" method="get">
					    <input type="hidden" name="pdCode" value="${product.pdCode}">
					    <div class="qt-area">
						    <c:choose>
						        <c:when test="${product.pdStock == 0}">
						            <i class="fa fa-minus minus-btn disabled"></i>
						            <strong><input name="quan" class="qt" value="0" disabled></strong>
						            <i class="fa fa-plus plus-btn disabled"></i>
						        </c:when>
						        <c:otherwise>
						            <i class="fa fa-minus minus-btn"></i>
						            <strong><input name="quan" class="qt" value="1" min="1" max="10"></strong>
						            <i class="fa fa-plus plus-btn"></i>
						        </c:otherwise>
						    </c:choose>
						</div>
						<c:choose>
					        <c:when test="${product.pdStock == 0}">
					            <button class="btn btn-secondary rounded-1 p-2 fs-7 btn-cart" disabled>매진</button>
					        </c:when>
					        <c:otherwise>
					             <button class="btn btn-theme" type="submit">🛒Cart</button>
					        </c:otherwise>
					    </c:choose>
					</form>

                    <p><span class="strong-text">Categories:</span> 커피, 원두</p>

                    <p><span class="strong-text">Tags:</span> 커피한잔, 원두판매</p>

                    

                    <ul class="product-info-btn">

                        <li><a href=""><i class="fa fa-heart-o"></i> Wishlist</a></li>

                    </ul>

                    <p><i class="fa fa-check"></i> 부드러운 산미의 커피를 즐기세요 </p>

                </div>

            </div>

        </div>

    </div> 

        <div class="container">

        <div class="row">

            <div class="single-product-tabs">

                <ul class="nav nav-tabs nav-single-product-tabs">

                    <li class="active"><a href="#description" data-toggle="tab">Description</a></li>

                    <li><a href="#reviews" data-toggle="tab">Reviews</a></li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="description">

                        <div class="product-desc">

                            <h2>상품상세정보</h2>
								
								<table class="table">
								  <thead>
								    <tr>
								      <th scope="col" style="width: 25%;">Information</th>
								      <th scope="col" style="width: 75%;">Details</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td>상품명</td>
								      <td>${product.pdName }</td>
								    </tr>
								    <tr>
								      <td>상품가격</td>
								      <td><fmt:formatNumber value="${product.pdPrice}" type="number" groupingUsed="true" />원</td>
								    </tr>
								    <tr>
								      <td>제조사</td>
								      <td>${product.manufacturer }</td>
								    </tr>
								    <tr>
								      <td>원산지</td>
								      <td>${product.pdCoo }</td>
								    </tr>
								    <tr>
								      <td>원재료명</td>
								      <td>${product.material }</td>
								    </tr>
								    <tr>
								      <td>제조일</td>
								      <td>${product.pdMfd }</td>
								    </tr>
								    <tr>
								      <td>유통기한</td>
								      <td>${product.pdExp }</td>
								    </tr>
								    <tr>
								      <td>고객센터</td>
								      <td>1899-0011</td>
								    </tr>
								    <tr>
								      <td>반품 및 교환처</td>
								      <td>구입처 또는 판매원</td>
								    </tr>
								    <tr>
								      <td>상품카테고리코드</td>
								      <td>${product.categoryCode }</td>
								    </tr>
								    <tr>
								      <td>기타사항</td>
								      <td>본 제품은 공정거래위원회고시 소비자분쟁해결 기준에 의거 교환 또는 보상 받을 수 있습니다. 부정, 불량식품 신고는 국번없이 1399 입니다. 판매 시 개봉되지 않은 제품에 한하여 품질을 보증합니다. 구입시 밀봉상태를 확인하십시오. 제품에 이상이 있거나 의문사항이 있을 시 드시지 마시고 구입처로 문의하시기 바랍니다. 질소충전</td>
								    </tr>
								  </tbody>
								</table>
							
                        </div>

                    </div>

						<div class="tab-pane" id="reviews">
						  <h3>리뷰 작성</h3>
						
						  <!-- 리뷰 작성 폼 -->
						  <form action="addReview.do" method="post">
						    <input type="hidden" name="pdCode" value="${product.pdCode}" />
						    <input type="hidden" name="userId" value="${sessionScope.loginId}" />
						
						    <div class="form-group">
						      <label>리뷰 제목</label>
						      <input type="text" name="reviewTitle" class="form-control" required>
						    </div>
						
						    <div class="form-group">
						      <label>리뷰 내용</label>
						      <textarea name="reviewContent" class="form-control" rows="3" required></textarea>
						    </div>
						
						    <button type="submit" class="btn btn-primary">리뷰 작성</button>
						  </form>
						
						  <hr/>
						
						  <!-- 리뷰 목록 -->
						  <table class="table">
						    <thead>
								  <tr>
								    <th style="width: 5%;">번호</th>
								    <th style="width: 10%;">작성자</th>
								    <th style="width: 25%;">리뷰제목</th>
								    <th style="width: 50%;">리뷰내용</th>
								    <th style="width: 10%;">삭제</th>
								  </tr>
								</thead>
								<tbody>
								  <c:forEach var="review" items="${review}" varStatus="status">
								    <tr>
								      <td>${review.reviewId}</td>
								      <td>${review.userId}</td>
								      <td>${review.reviewTitle}</td>
								      <td>${review.reviewContent}</td>
								      <td>
								        <form action="deleteReview.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
								          <input type="hidden" name="reviewId" value="${review.reviewId}" />
								          <input type="hidden" name="pdCode" value="${product.pdCode}" />
								          <button type="submit" class="btn btn-danger btn-sm">삭제</button>
								        </form>
								      </td>
								    </tr>
								  </c:forEach>
								</tbody>
							</table>
						</div>

                </div>

            </div>

        </div>

    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const minusBtns = document.querySelectorAll('.minus-btn');
        const plusBtns = document.querySelectorAll('.plus-btn');
        const quantityInputs = document.querySelectorAll('.qt');
        const calculatedPriceSpans = document.querySelectorAll('#calculatedPrice');
        const originalPriceValue = ${product.pdPrice}; // JSP에서 가격을 JavaScript 변수로 전달
        const productStock = ${product.pdStock}; // JSP에서 재고를 JavaScript 변수로 전달

        // 재고가 0이면 수량 조절 버튼 및 입력 필드 비활성화
        if (productStock === 0) {
            minusBtns.forEach(btn => btn.classList.add('disabled'));
            plusBtns.forEach(btn => btn.classList.add('disabled'));
            quantityInputs.forEach(input => input.disabled = true);
        } else {
            minusBtns.forEach((btn) => {
                btn.addEventListener('click', function() {
                    let currentValue = parseInt(this.parentNode.querySelector('.qt').value);
                    if (currentValue > 1) {
                        this.parentNode.querySelector('.qt').value = currentValue - 1;
                        updateCalculatedPrice(currentValue - 1);
                    }
                });
            });

            plusBtns.forEach((btn)  => {
                btn.addEventListener('click', function() {
                    let currentValue = parseInt(this.parentNode.querySelector('.qt').value);
                    if (currentValue < 10) {
                        this.parentNode.querySelector('.qt').value = currentValue + 1;
                        updateCalculatedPrice(currentValue + 1);
                    }
                });
            });
        }

        function updateCalculatedPrice(quantity) {
            const newPrice = originalPriceValue * quantity;
            const formattedPrice = newPrice.toLocaleString() + "원";
            document.querySelector('#calculatedPrice').textContent = formattedPrice;
        }
    });

	</script>
    
    	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="js/script.js"></script>

</body>

</html>