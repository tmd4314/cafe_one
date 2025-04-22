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
		    .cart-header {
		        background-color: #808080 ; /* 진한 회색 배경 */
		        padding: 10px;
		        border-bottom: 1px solid #dee2e6; /* 구분선 */
		        color: white; /* 글자 색상 */
		        font-weight: bold; /* 글자 굵게 */
		    }
		
		    .cart-header .form-check-label {
		        margin-left: 0.5rem; /* 체크박스 옆 여백 */
		    }
		
		    .cart-header div {
		        text-align: center; /* 텍스트 가운데 정렬 */
		    }
		  /* 전체 드롭다운 메뉴 */
		  .dropdown-menu.p-4 {
		    font-size: 1.05rem; /* 글자 크기 */
		    padding: 2rem !important; /* 여백 */
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
