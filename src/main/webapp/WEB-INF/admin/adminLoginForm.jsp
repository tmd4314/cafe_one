<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-container {
      max-width: 450px;
      margin: 80px auto;
      background: white;
      padding: 2.5rem;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-title {
      text-align: center;
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="login-container">
    <h3 class="login-title">관리자 로그인</h3>

    <form action="adminLogin.do" method="post">
      <div class="mb-3">
        <label for="adminId" class="form-label">아이디</label>
        <input type="text" class="form-control" id="adminId" name="adminId" required>
      </div>
      <div class="mb-3">
        <label for="adminPw" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="adminPw" name="adminPw" required>
      </div>
      <button type="submit" class="btn btn-primary w-100">로그인</button>
    </form>

    <c:if test="${not empty error}">
      <div class="alert alert-danger mt-3 text-center">
        ${error}
      </div>
    </c:if>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
