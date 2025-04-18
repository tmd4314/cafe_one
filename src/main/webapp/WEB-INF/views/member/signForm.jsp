<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--Font-aweome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<!--Custom Css-->
<link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body>
	<section class="login_section">
		<div class="container outer_container accounts_container">
			<div class="row h-100">
				<div
					class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
					<!--accounts_image-->
				</div>
				<!--account_col-->
				<div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
					<div class="accounts_forms signup_form w-100 h-100" id="signup">
						<div class="title mt-4 p-4 w-100">
							<h1>회원가입</h1>
						</div>
						<!--title-->
						
						<form method="post" name="form" class="form w-100 p-4"
							action="signUp.do" id="form">
							<div class="row">
								<div>
									<div class="form-group">
										<label for="fname">이름</label> <input type="text"
											name="userName" class="form-control" id="userId"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>
								<div>
									<div class="form-group">
										<label for="lname">휴대폰번호</label> <input type="text"
											name="phone" class="form-control" id="password"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>
							</div>
							<!--form-row-->
							<div class="form-group">
								<label for="userId">아이디</label> <input type="userId"
									name="userId" class="form-control" id="userId"
									onfocus="labelUp(this)" onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="email" name="email"
									class="form-control" id="email" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="address">주소</label> <input type="text"
									name="address" class="form-control" id="address"
									onfocus="labelUp(this)" onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="signup_password">비밀번호 ${mes}</label> <i
									class="fa fa-eye-slash" id="eye_icon_signup"></i> <input
									type="password" name="password" class="form-control"
									id="signup_password" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="cpass">비밀번호 확인</label> <input type="password"
									name="cpass" class="form-control" id="password"
									onfocus="labelUp(this)" onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary register_btn w-100">회원가입</button>
							</div>
						</form>
	
						<div class="already_member_box">
							<p class="text-center" id="to_login">환영합니다</p>
						</div>
					</div>