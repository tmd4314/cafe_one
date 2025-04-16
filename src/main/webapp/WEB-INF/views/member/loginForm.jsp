<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="keywords" content="SignUp, Login, Register">
  <meta name="keywords" content="Sign up, Sign in">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!--Bootstrap Css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <!--Font-aweome-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <!--Custom Css-->
  <link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body>
  <section class="login_section">
    <div class="container outer_container accounts_container">
      <div class="row h-100">
        <div class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
          </div>
          <!--accounts_image-->
        </div>
        <!--account_col-->
        <div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
          <!--accounts_forms-->
          <div class="accounts_forms  w-100 h-100" id="login">
            <div class="title  mt-4 p-4 w-100">
              <h1>로그인</h1>
            </div>
            <!--title-->
            <form method="post" name="form" class="form  w-100 p-4" id="form" action="login.do">
                  <!-- msg 출력. -->
                  <c:if test="${msg != null }">
			      <p style="color: red"><c:out value="${msg }"/></p>
			      </c:if>
              <div class="form-group">
                <label for="uname">아이디</label>
                <input type="text" name="uname" class="form-control" id="userid" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="psw">비밀번호</label>
                <i class="fa fa-eye-slash" id="eye_icon_login"></i>
                <input type="password" name="psw" class="form-control" id="userpw" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group mb-0">
                <button type="submit" class="btn btn-primary register_btn w-100">로그인</button>
              </div>
            </form>
            <div class="already_member_box d-flex justify-content-between px-4">
              <span class="text-center" id="">비밀번호 찾기</span>
              <span class="text-center" id="to_signup">회원가입</span>
            </div>
          </div>
          <!--accounts_forms-->
  </section>
  <!--login_section-->

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <!--Custom Js-->
  <script type="text/javascript" src="js/app.js"></script>

</body>

</html>