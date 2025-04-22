<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!-- template 파일. -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Shop Homepage - Start Bootstrap Template</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/ProductList.css">
	<style>
		body {
		    background-image: url('images/coffee-one.png'); /* 배경 이미지 경로 */
		    background-size: cover; /* 배경 이미지를 화면에 맞게 조절 */
		    background-position: center; /* 배경 이미지 중앙 정렬 */
		    background-repeat: no-repeat; /* 배경 이미지 반복 안 함 */
		    position: relative; /* 자식 요소를 절대 위치로 설정할 수 있도록 함 */
		    z-index: 1; /* 기본 배경의 z-index 설정 */
		    color: white; /* 기본 글자색을 흰색으로 설정 */
		}
		
		.container {
		    position: relative; /* 컨테이너 요소가 자식 요소에 대해 상대적으로 위치할 수 있도록 설정 */
		    z-index: 2; /* 컨테이너의 z-index가 배경보다 높게 설정 */
		}
		/* 필요한 경우 특정 요소에 대한 글자색을 재정의할 수 있습니다. */
		h1, h2, h3, h4, h5, h6 {
		    color: white; /* 제목 글자색을 흰색으로 설정 */
		}
		
		p, div, span, a, li {
		    color: white; /* 일반 텍스트, div, span, 링크, 목록 항목 글자색을 흰색으로 설정 */
		}
		.cart-header {
			background-color: #808080;
			/* 진한 회색 배경 */
			padding: 10px;
			border-bottom: 1px solid #dee2e6;
			/* 구분선 */
			color: white;
			/* 글자 색상 */
			font-weight: bold;
			/* 글자 굵게 */
		}

		.cart-header .form-check-label {
			margin-left: 0.5rem;
			/* 체크박스 옆 여백 */
		}

		.cart-header div {
			text-align: center;
			/* 텍스트 가운데 정렬 */
		}

		/* 전체 드롭다운 메뉴 */
		.dropdown-menu.p-4 {
			font-size: 1.05rem;
			/* 글자 크기 */
			padding: 2rem !important;
			/* 여백 */
		}

		/* 각 항목 */
		.dropdown-menu .dropdown-item {
			padding: 0.6rem 1rem;
			font-size: 1.05rem;
		}

		/* 대분류 제목 */
		.dropdown-header {
			font-size: 1.15rem;
			font-weight: bold;
			margin-bottom: 0.8rem;
		}

		/* 오프캔버스 메뉴(왼쪽 슬라이드) */
		.offcanvas .btn-toggle {
			font-size: 1.05rem;
			padding: 0.75rem 1rem;
		}

		.offcanvas .btn-toggle-nav .dropdown-item {
			font-size: 1.05rem;
			padding: 0.5rem 1rem;
		}

		.offcanvas .btn-toggle-nav {
			margin-bottom: 1rem;
		}

		
	</style>

</head>

<body>
	<tiles:insertAttribute name="menu" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>

</html>