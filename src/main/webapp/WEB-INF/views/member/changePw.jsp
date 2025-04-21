<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="keywords"
	content="SignUp, Login, Register, Sign up, Sign in">
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
					class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
					<!--accounts_image-->
				</div>
				<!--accounts_image-->
				<!--account_col-->
				<div class="col col-sm-12 col-md-12 col-lg-6 m-0 p-0 accounts_col">
					<div class="accounts_forms signup_form w-100 h-100" id="signup">
						<div class="title mt-4 p-4 w-100">
							<h1>비밀번호 변경</h1>
						</div>
						<!--title-->

						<form method="post" name="changePw" class="form w-100 p-4"
							action="changePw.do">
							<div class="row">
								<div>
									<div class="form-group">
										<label for="mypass">현재 비밀번호 ${msg}</label> <input type="password"
											name="mypass" class="form-control" id="mypass"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
									<div class="form-group">
										<label for="newpass">새 비밀번호 ${msg1}</label> <i
											class="fa fa-eye-slash" id="eye_icon_signup"></i> <input
											type="password" name="newpass" class="form-control" id="newpass"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
									<div class="form-group">
										<label for="newcpass">비밀번호 확인</label> <input type="password"
											name="newcpass" class="form-control" id="newcpass"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary register_btn w-100">비밀번호
									수정</button>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div
			class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
			<!--accounts_image-->
		</div>