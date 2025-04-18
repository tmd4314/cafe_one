<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                       <div class="thumb-main-image"><a href=""><img src="images/커피한잔 레오 블렌드 500g.png" alt=""></a></div>

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

                        <span class="product-id"><span class="strong-text">Product ID:</span> RST 4562</span>

                        

                        <span class="product-avilability"><span class="strong-text">Availability:</span> In Stock</span>

                    </div>

                    <p class="short-info">고급스러운 산미가 기분좋게 느껴지는 스타일의 로스팅 원두</p>

                    <div class="price">

                        <span>${product.pdPrice }</span>

                    </div>

                    <form action="" class="purchase-form">

                       <div class="qt-area">

                           <i class="fa fa-minus"></i>

                           <input name="quantity" class="qt" value="1">

                           <i class="fa fa-plus"></i>

                       </div>

                        

                        <button class="btn btn-theme" type="submit">Add to cart</button>

                        <div class="social-share">

                            <ul>

                                <li><a href=""><i class="fa fa-facebook"></i></a></li>

                                <li><a href=""><i class="fa fa-twitter"></i></a></li>

                                <li><a href=""><i class="fa fa-google-plus"></i></a></li>

                                <li><a href=""><i class="fa fa-linkedin"></i></a></li>

                            </ul>

                        </div>

                    </form>

                    <p><span class="strong-text">Categories:</span> 커피, 원두</p>

                    <p><span class="strong-text">Tags:</span> 커피한잔, 원두판매</p>

                    

                    <ul class="product-info-btn">

                        <li><a href=""><i class="fa fa-heart-o"></i> Wishlist</a></li>

                        <li><a href=""><i class="fa fa-arrows-h"></i> Compare</a></li>

                        <li><a href=""><i class="fa fa-envelope-o"></i> Email</a></li>

                        <li><a href=""><i class="fa fa-print"></i> Print</a></li>

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
								
								<div class="bg-white">
								  <div class="mx-auto grid max-w-2xl grid-cols-1 items-center gap-x-8 gap-y-16 px-4 py-24 sm:px-6 sm:py-32 lg:max-w-7xl lg:grid-cols-2 lg:px-8">
								    <div>
								      <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Technical Specifications</h2>
								      <p class="mt-4 text-gray-500">The walnut wood card tray is precision milled to perfectly fit a stack of Focus cards. The powder coated steel divider separates active cards from new ones, or can be used to archive important task lists.</p>
								
								      <div class="border-t border-gray-200 pt-4">
  										<dl>
    										<dt class="font-medium text-gray-900">Origin</dt>
    										<dd class="mt-2 text-sm text-gray-500">Designed by Good Goods, Inc.</dd>
									  	</dl>
									  </div>
									  <div class="border-t border-gray-200 pt-4">
  										<dl>
    										<dt class="font-medium text-gray-900">Origin</dt>
    										<dd class="mt-2 text-sm text-gray-500">Designed by Good Goods, Inc.</dd>
									  	</dl>
									  </div>
		
								    </div>
								  </div>
								</div>
							
                        </div>

                    </div>

                    <div class="tab-pane" id="reviews">
						<p>리뷰 번호 : ${review.reviewId } 리뷰 제목 : ${review.reviewTitle } 리뷰 내용 : ${review.reviewContent } 리뷰 작성일 : ${review.createDate }</p>
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