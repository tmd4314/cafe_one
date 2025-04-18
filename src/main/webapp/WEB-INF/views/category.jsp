<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <!-- 카테고리 리스트 페이지 -->
 <div class="container mt-5">
   <h3 class="mb-4">카테고리 목록</h3>
 
   <!-- 대분류 목록 -->
   <div class="mb-3">
     <label class="fw-bold">대분류 선택</label>
     <select id="mainCategory" class="form-select form-select-sm w-auto">
       <option value="">대분류 선택</option>
       <c:forEach var="main" items="${mainCategoryList}">
         <option value="${main}">${main}</option>
       </c:forEach>
     </select>
   </div>
 
   <!-- 소분류 목록 -->
   <div class="mb-3">
     <label class="fw-bold">소분류</label>
     <select id="subCategory" class="form-select form-select-sm w-auto">
       <option value="">소분류 선택</option>
       <c:forEach var="cat" items="${categoryList}">
         <option value="${cat.subcategoryName}" data-main="${cat.categoryName}">
           ${cat.subcategoryName}
         </option>
       </c:forEach>
     </select>
   </div>
 </div>
 
 <!-- 대분류 선택 시 해당 소분류만 표시 -->
 <script>
   document.addEventListener("DOMContentLoaded", function () {
     const mainSelect = document.getElementById('mainCategory');
     const subSelect = document.getElementById('subCategory');
 
     mainSelect.addEventListener('change', function () {
       const selectedMain = this.value;
       Array.from(subSelect.options).forEach(option => {
         option.style.display = option.dataset.main === selectedMain || option.value === "" ? 'block' : 'none';
       });
       subSelect.value = "";
     });
   });
 </script>