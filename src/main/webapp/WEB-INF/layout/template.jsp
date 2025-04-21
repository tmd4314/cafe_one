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
		</style>
    </head>
    <body>
        <tiles:insertAttribute name="menu" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
    </body>
</html>
