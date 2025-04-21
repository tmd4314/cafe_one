<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이 쇼핑</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #fff;
	margin: 0;
	padding: 0;
	color: #333;
}

.container {
	width: 1000px;
	margin: 0 auto;
	padding: 40px 0;
}

h1 {
	text-align: center;
	margin-bottom: 40px;
}

.top-boxes {
	display: flex;
	border: 1px solid #ddd;
}

.top-box {
	flex: 1;
	padding: 20px;
	border-right: 1px solid #ddd;
	text-align: center;
}

.top-box:last-child {
	border-right: none;
}

.top-box strong {
	display: block;
	margin-bottom: 5px;
}

.profile {
	display: flex;
	align-items: center;
	justify-content: center;
}

.profile img {
	width: 50px;
	margin-right: 10px;
}

.side-menu {
	float: left;
	width: 200px;
}

.side-menu h4 {
	font-size: 14px;
	margin-top: 30px;
	margin-bottom: 10px;
}

.side-menu ul {
	list-style: none;
	padding-left: 0;
}

.side-menu li {
	font-size: 13px;
	margin: 5px 0;
	cursor: pointer;
}

.side-menu li a {
  text-decoration: none;
  color: inherit;  /* 부모 요소의 색상을 상속받음 */
  font-size: 13px;  /* 기존 폰트 크기와 동일하게 */
  cursor: pointer;
}

/* 방문한 링크도 같은 색상 유지 */
.side-menu li a:visited {
  color: inherit;
}

.side-menu li a:hover {
  text-decoration: underline;
}

.main-content {
	margin-left: 220px;
}

.status-box {
	display: flex;
	justify-content: space-around;
	margin-top: 40px;
	border-top: 2px solid #333;
	padding-top: 20px;
	font-size: 14px;
}

.status-box div {
	text-align: center;
}

.status-footer {
	display: flex;
	justify-content: space-around;
	border: 1px solid #ddd;
	margin: 20px 0;
	padding: 10px 0;
}

.order-table {
	text-align: center;
	padding: 50px 0;
	border-top: 1px solid #ddd;
}

.order-table .icon {
	font-size: 40px;
	color: #aaa;
}

.pagination {
	text-align: center;
	padding-bottom: 40px;
}

.pagination span {
	display: inline-block;
	margin: 0 5px;
	cursor: pointer;
	color: #aaa;
}

.pagination .active {
	font-weight: bold;
	color: black;
}

.menu-divider {
	width: 50px;
	height: 1px;
	background-color: #ddd;
	margin: 20px 0 15px 0;
	margin-top: 30px;
}

.main-content h4:first-child {
	margin-top: 30px; /* 여기서 값을 조절하여 원하는 간격을 설정할 수 있습니다 */
}
</style>
</head>
<body>
	<div class="container">
		<h1>마이 쇼핑</h1>

		<div class="top-boxes">
			<div class="top-box">
				<div class="profile">
					<img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
						alt="user" />
					<div>
						<strong>안녕하세요. <%=session.getAttribute("userName") != null ? session.getAttribute("userName") : "고객"%>
							님!
						</strong> 고객님의 회원등급은 <strong>NEW</strong> 입니다.
					</div>
				</div>
			</div>
			<div class="top-box">
				<strong>3,000원</strong> 총 적립금
			</div>
			<div class="top-box">
				<strong>0개</strong> 쿠폰
			</div>
			<div class="top-box">
				<strong>KRW 0(0회)</strong> 총 주문
			</div>
		</div>
		<form action="myPage.do" method="post">
			<div class="side-menu">
				<div class="menu-divider"></div>
				<h4><b>나의 쇼핑 정보</b></h4>
				<ul>
					<li><a href="">주문내역 조회</a></li>
					<li><a href="">취소/반품 내역</a></li>
					<li><a href="cartList.do">장바구니</a></li>
					<li><a href="wishlist.do">찜리스트</a></li>
				</ul>
				<div class="menu-divider"></div>
				<h4><b>나의 상품후기</b></h4>
				<ul>
					<li><a href="">나의 상품후기</a></li>
				</ul>
				<div class="menu-divider"></div>
				<h4><b>정보 변경</b></h4>
				<ul>
					<li><a href="">회원 정보 수정</a></li>
					<li><a href="">비밀번호 변경</a></li>
					<li><a href="dropUser.do">회원 탈퇴</a></li>
				</ul>
			</div>
		</form>

		<div class="main-content">
			<h4>나의 주문처리 현황 (최근 3개월 기준)</h4>
			<div class="status-box">
				<div>
					<strong>0</strong><br>입금전
				</div>
				<div>
					<strong>0</strong><br>배송준비중
				</div>
				<div>
					<strong>0</strong><br>배송중
				</div>
				<div>
					<strong>0</strong><br>배송완료
				</div>
			</div>

			<div class="status-footer">
				<div>
					취소 : <strong>0</strong>
				</div>
				<div>
					교환 : <strong>0</strong>
				</div>
				<div>
					반품 : <strong>0</strong>
				</div>
			</div>

			<div class="order-table">
				<div class="icon">❕</div>
				<p>주문 내역이 없습니다.</p>
			</div>

			<div class="pagination">
				<span>&laquo;</span> <span class="active">1</span> <span>&raquo;</span>
			</div>
		</div>
	</div>
</body>
</html>
