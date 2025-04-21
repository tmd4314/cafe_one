<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="container">
	<!-- 이달의 상품 추천 시작 -->
	<div class="main_h1">
		<h2>
			<strong>이달의 추천 상품</strong> <span> 무엇인지 궁금하시죠?</span>
		</h2>
	</div>
	<div class="main_goods">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach var="pdsf" items="${listSF}">
					<div class="swiper-slide">
						<div class="product-item">
							<div class="discount">n%</div>
							<a href="#">
								<img src="images/${pdsf.pdimg}" alt="${pdsf.pdName}">
								<h5 class="product-title">${pdsf.pdName}</h5>
							</a>
							<div class="price-box">
								<del>${pdsf.pdPrice}원</del>
								<span class="price">${pdsf.pdPrice}원</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Swiper Navigation Buttons -->
			<button type="button" class="swiper-button-prev" aria-label="이전 배너 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
					<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
					<path d="M22.5 27L15.7121 20.2119C15.595 20.0948 15.595 19.9048 15.7121 19.7877L22.5 13" stroke="black"
						stroke-width="1.5"></path>
				</svg>
			</button>
			<button type="button" class="swiper-button-next" aria-label="다음 배너 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
					<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
					<path d="M17.5 27L24.2879 20.2119C24.405 20.0948 24.405 19.9048 24.2879 19.7877L17.5 13" stroke="black"
						stroke-width="1.5"></path>
				</svg>
			</button>
		</div>
	</div>


	<!-- 이달의 상품 추천 끝-->

	<!-- 신상품 추천 시작 -->
	<div class="main_h1">
		<h3>신상품 추천</h3>
	</div>
	<div class="new-goods">
		<div class="new-goods-list">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<c:forEach var="pdsf" items="${listSF}">
						<div class="swiper-slide">
							<div class="product-item">
								<div class="discount">n%</div>
								<a href="#">
									<img src="images/${pdsf.pdimg}" alt="${pdsf.pdName}">
									<h5 class="product-title">${pdsf.pdName}</h5>
								</a>
								<div class="price-box">
									<del>${pdsf.pdPrice}원</del>
									<span class="price">${pdsf.pdPrice}원</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- Swiper Navigation Buttons -->
				<button type="button" class="swiper-button-prev" aria-label="이전 배너 보기">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
						<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
						<path d="M22.5 27L15.7121 20.2119C15.595 20.0948 15.595 19.9048 15.7121 19.7877L22.5 13" stroke="black"
							stroke-width="1.5"></path>
					</svg>
				</button>
				<button type="button" class="swiper-button-next" aria-label="다음 배너 보기">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
						<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
						<path d="M17.5 27L24.2879 20.2119C24.405 20.0948 24.405 19.9048 24.2879 19.7877L17.5 13" stroke="black"
							stroke-width="1.5"></path>
					</svg>
				</button>
			</div>
		</div>
	</div>
	<!-- 신상품 추천 끝 -->

	<!-- 할인 상품 추천 시작 -->
	<h2 class="main_h1">
		<strong>할인상품 구경하세요! </strong> <span>할인 팍팍!</span>
	</h2>

	<div class="main_h1">
		<div class="goods_list_tit">
			<h3>!!할인상품 목록!!</h3>
		</div>

	</div>
	<div class="discounted-goods">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach var="pdsf" items="${listSF}">
					<div class="swiper-slide">
						<div class="product-item">
							<div class="discount">n%</div>
							<a href="#">
								<img src="images/${pdsf.pdimg}" alt="${pdsf.pdName}">
								<h5 class="product-title">${pdsf.pdName}</h5>
							</a>
							<div class="price-box">
								<del>${pdsf.pdPrice}원</del>
								<span class="price">${pdsf.pdPrice}원</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Swiper Navigation Buttons -->
			<button type="button" class="swiper-button-prev" aria-label="이전 배너 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
					<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
					<path d="M22.5 27L15.7121 20.2119C15.595 20.0948 15.595 19.9048 15.7121 19.7877L22.5 13" stroke="black"
						stroke-width="1.5"></path>
				</svg>
			</button>
			<button type="button" class="swiper-button-next" aria-label="다음 배너 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
					<circle cx="20" cy="20" r="19.5" fill="white" stroke="#E0E0E0"></circle>
					<path d="M17.5 27L24.2879 20.2119C24.405 20.0948 24.405 19.9048 24.2879 19.7877L17.5 13" stroke="black"
						stroke-width="1.5"></path>
				</svg>
			</button>
		</div>
	</div>
	<!-- 할인 상품 추천 끝 -->


	<!-- //layer_wrap -->
	<!-- wish form -->
	<form id="frmView" method="post">
		<input type="hidden" name="mode" value="wishIn"> <input type="hidden" name="cartMode" value=""> <input type="hidden"
			name="optionFl" value=""> <input type="hidden" name="minOrderCnt" value="">
	</form>
</div>
</div>
</div>
</body>
<script src="js/productList.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 스와이프 기능 관련 추가 -->
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />