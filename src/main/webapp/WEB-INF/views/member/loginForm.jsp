<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-color: #fff;
	color: #333;
}

.container {
	width: 400px;
	margin: 50px auto;
}

h2 {
	font-size: 22px;
	margin-bottom: 20px;
	font-weight: 500;
}

.login-box {
	border: 1px solid #e1e1e1;
	padding: 30px;
}

.login-title {
	font-size: 16px;
	margin-bottom: 20px;
	font-weight: normal;
}

.login-flex {
	display: flex;
	gap: 10px;
}

.login-btn {
	width: 100px;
	height: 90px;
	background-color: #444;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 14px;
}

.input-group {
	margin-bottom: 10px;
}

.input-field {
	width: 100%;
	height: 40px;
	border: 1px solid #e1e1e1;
	padding: 0 10px;
	font-size: 14px;
	border-radius: 0;
	outline: none;
}

.checkbox-wrap {
	flex: 1;
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.btn {
	padding: 10px 0;
	text-align: center;
	flex: 1;
	cursor: pointer;
	font-size: 14px;
	border: none;
}

.btn-dark {
	background-color: #666;
	color: white;
}

.btn-light {
	background-color: white;
	border: 1px solid #ccc;
	color: #333;
}

.btn+.btn {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>로그인</h2>
		<div class="login-box">
			<h3 class="login-title">회원 로그인</h3>
			<form action="login.do" method="post">
				<div class="login-flex">
					<div class="input-wrap">
						<div class="input-group">
							<input type="text" name="uname" class="input-field"
								placeholder="아이디">
						</div>
						<div class="input-group">
							<input type="password" name="psw" class="input-field"
								placeholder="비밀번호">
						</div>
					</div>
					<button type="submit" class="login-btn">로그인</button>
				</div>

				<div class="checkbox-wrap">
					<input type="checkbox" id="saveId" name="saveId"> <label
						for="saveId">아이디 저장</label>
				</div>

				<div class="button-group">
					<button type="button" class="btn btn-dark"
						onclick="location.href='signForm.do'">회원가입</button>
					<button type="button" class="btn btn-light"
						onclick="location.href='findId.do'">아이디 찾기</button>
					<button type="button" class="btn btn-light"
						onclick="location.href='findPw.do'">비밀번호 찾기</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>