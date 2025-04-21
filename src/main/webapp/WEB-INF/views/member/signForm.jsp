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
					class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
					<!--accounts_image-->
				</div>
				<!--accounts_image-->
				<!--account_col-->
				<div class="col col-sm-12 col-md-12 col-lg-6 m-0 p-0 accounts_col">
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
										<label for="userId">아이디</label> <input type="userId"
											name="userId" class="form-control" id="userId"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>

								</div>
								<div>
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

								</div>
							</div>
							<div class="form-group">
								<label for="fname">이름</label> <input type="text" name="userName"
									class="form-control" id="userId" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="email" name="email"
									class="form-control" id="email" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="lname">휴대폰번호</label> <input type="text" name="phone"
									class="form-control" id="password" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>

							<!-- 주소 api -->
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-6 m-0">
									<div class="form-group">
										<label for="address1">우편번호</label> <input type="text"
											name="address1" class="form-control" id="sample6_postcode"
											placeholder="우편번호" onfocus="labelUp(this)"
											onblur="labelDown(this)" required />
									</div>
								</div>
								<div class="col col-sm-12 col-md-12 col-lg-6 m-0 d-flex align-items-end">
									<div class="form-group">
										<label for="address"> </label> <input type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
											name="address" class="form-control" id="address2"
											style="background-color: #007bff; color: white; border: 1px solid #007bff;"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="address2"></label> <input type="text"
									name="address2" class="form-control" id="sample6_address"
									placeholder="주소" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-6 m-0">
								<div class="form-group">
										<label for="address3"> </label> <input type="text"
											placeholder="참고항목" name="address3" class="form-control"
											id="sample6_extraAddress" onfocus="labelUp(this)"
											onblur="labelDown(this)" required />
									</div>
									
								</div>
								<div class="col col-sm-12 col-md-12 col-lg-6 m-0">
									<div class="form-group">
										<label for="address4"></label> <input type="text"
											name="address4" class="form-control"
											id="sample6_detailAddress" placeholder="상세주소"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary register_btn w-100">회원가입</button>
							</div>
						</form>

						<div class="already_member_box">
							<p class="text-center" id="to_login">환영합니다</p>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
				<!--accounts_image-->
			</div>

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function sample6_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var addr = ''; // 주소 변수
									var extraAddr = ''; // 참고항목 변수

									//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}

									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if (data.userSelectedType === 'R') {
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document
												.getElementById("sample6_extraAddress").value = extraAddr;

									} else {
										document
												.getElementById("sample6_extraAddress").value = '';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample6_postcode').value = data.zonecode;
									document.getElementById("sample6_address").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById(
											"sample6_detailAddress").focus();
								}
							}).open();
				}
			</script>