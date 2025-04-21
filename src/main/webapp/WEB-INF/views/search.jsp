<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>상품 검색 결과</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    body {
      color: #566787;
      background: #f5f5f5;
      font-family: 'Roboto', sans-serif;
    }
    .table-wrapper {
      background: #fff;
      padding: 20px;
      margin: 30px 0;
      box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title h2 {
      margin: 0 0 10px;
    }
    .search-box {
      position: relative;
      float: right;
    }
    .search-box input {
      height: 34px;
      border-radius: 20px;
      padding-left: 35px;
      border-color: #ddd;
    }
    .search-box i {
      color: #a0a5b1;
      position: absolute;
      font-size: 19px;
      top: 8px;
      left: 10px;
    }
    .table td a {
      color: #03A9F4;
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="table-wrapper">
    <div class="row">
      <div class="col-sm-8">
        <h2>상품 검색 결과 <b>${keyword}</b></h2>
      </div>
      <div class="col-sm-4">
        <form action="search.do" method="get" class="search-box">
          <i class="material-icons">&#xE8B6;</i>
          <input type="text" name="keyword" value="${keyword}" placeholder="상품명 검색" class="form-control">
        </form>
      </div>
    </div>

    <c:if test="${empty searchList}">
      <div class="alert alert-warning mt-3">검색 결과가 없습니다.</div>
    </c:if>

    <c:if test="${not empty searchList}">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>제조사</th>
            <th>상세보기</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="p" items="${searchList}">
            <tr>
              <td>${p.pdName}</td>
              <td><fmt:formatNumber value="${p.pdPrice}" pattern="#,###"/> 원</td>
              <td>${p.manufacturer}</td>
              <td><a href="productInfo.do?code=${p.pdCode}">보기</a></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>
</div>
</body>
</html>
