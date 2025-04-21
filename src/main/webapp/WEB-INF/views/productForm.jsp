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

</head>

<body>

    <div class="breadcumbs">

        <div class="container">

            <div class="row">

                <span>Home > 커피 > 원두 > </span>

            </div>

        </div>

    </div>  

    <div class="short-description">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                   <div class="col-md-10 col-sm-10 col-xs-10">

                       <div class="thumb-main-image"><a href=""><img src="images/${product.pdimg }" alt=""></a></div>

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

                        <span><fmt:formatNumber value="${product.pdPrice}" type="number" groupingUsed="true" />원</span>

                    </div>

                    <form action="" class="purchase-form">

                       <div class="qt-area">

                           <i class="fa fa-minus"></i>

                           <input name="quantity" class="qt" value="1">

                           <i class="fa fa-plus"></i>

                       </div>

                        

                        <button class="btn btn-theme" type="submit">Add to cart</button>

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
      <th scope="col" style="width: 25%;">Imformation</th>
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
					
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 5%;">번호</th>
					      <th scope="col" style="width: 10%;">작성자</th>
					      <th scope="col" style="width: 25%;">리뷰제목</th>
					      <th scope="col" style="width: 60%;">리뷰내용</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="review" items="${review}" varStatus="status">
						    <tr>
						      <th scope="row">${review.reviewId }</th>
						      <td>${review.userId }</td>
						      <td>${review.reviewTitle }</td>
						      <td>${review.reviewContent }</td>
						    </tr>
					    </c:forEach>
					  </tbody>
					</table>	
								
                    </div>

                </div>

            </div>

        </div>

    </div>
    
    	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="js/script.js"></script>

</body>

</html>