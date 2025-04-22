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
      display: flex;
      gap: 5px;
    }
    .search-box input,
    .search-box select,
    .search-box button {
      height: 34px;
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
    <div class="row mb-3">
      <div class="col-sm-12">
        <!-- ✅ 검색 필터 -->
        <form action="search.do" method="get" class="search-box d-flex">

		  <!-- 대분류 (CATEGORY_NAME) -->
		  <select name="main" class="form-control" style="width:auto; margin-right:5px;" id="mainCategory">
		    <option value="">대분류 선택</option>
		    <c:forEach var="main" items="${mainCategoryList}">
		      <option value="${main}" <c:if test="${main == param.main}">selected</c:if>>${main}</option>
		    </c:forEach>
		  </select>
		
		  <!-- 소분류 (CATEGORY_CODE + data-main for filtering) -->
		  <select name="sub" class="form-control" style="width:auto; margin-right:5px;" id="subCategory">
		    <option value="">소분류 선택</option>
		    <c:forEach var="cat" items="${categoryList}">
		      <option value="${cat.categoryCode}" data-main="${cat.categoryName}" 
		              <c:if test="${sub == cat.categoryCode}">selected</c:if>>
		        ${cat.subcategoryName}
		      </option>
		    </c:forEach>
		  </select>
		
		  <input type="text" name="keyword" value="${keyword}" placeholder="상품명 검색" class="form-control" style="width:auto;">
		  <button type="submit" class="btn btn-primary">검색</button>
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

<!-- ✅ 내부 자바스크립트 (필터 연동) -->
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const mainSelect = document.getElementById('mainCategory');
    const subSelect = document.getElementById('subCategory');

    function filterSubCategories() {
      const selectedMain = mainSelect.value;
      Array.from(subSelect.options).forEach(option => {
        if (!option.value) return; // "소분류 선택"은 항상 표시
        const match = option.getAttribute("data-main") === selectedMain;
        option.style.display = match ? "block" : "none";
      });
      subSelect.value = ""; // 소분류 초기화
    }

    mainSelect.addEventListener("change", filterSubCategories);

    // 페이지 로딩 시 필터 적용
    filterSubCategories();
  });
</script>

</body>
</html>
