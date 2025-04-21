<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
<header>
	<div class="container">
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
				<strong><fmt:formatNumber value="${sessionScope.mile}" pattern="#,###" />원</strong> 총 적립금
			</div>
			<div class="top-box">
				<strong>KRW(<c:out value="${orderCount}" />회)</strong> 총 주문
			</div>
		</div>
		<form action="myPage.do" method="post">
			<div class="side-menu">
				<div class="menu-divider"></div>
				<h4><b>나의 쇼핑 정보</b></h4>
				<ul>
					<li><a href="orderForm.do">주문내역 조회</a></li>
					<li><a href="cartList.do" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart" onclick="loadCart()">장바구니</a></li>
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
					<li><a href="changePw.do">비밀번호 변경</a></li>
					<li><a href="">회원 탈퇴</a></li>
				</ul>
			</div>
		</form>

		<div class="main-content">
			<section class="login_section">
				<div class="container outer_container accounts_container">
					<div class="row h-100">
						<div
							class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
							<!--accounts_image-->
						</div>
						<!--account_col-->
						<div class="col col-sm-12 col-md-12 col-lg-6 m-0 p-0 accounts_col">
							<div class="accounts_forms signup_form w-100 h-100" id="signup">
								<!--title-->
		
								<form method="post" name="form" class="form w-100 p-4"
									action="updateMember.do" id="form">
									<div class="form-group">
										<label for="userName">이름</label>
										<input type="text" name="userName" class="form-control" id="userName"
											value="${sessionScope.userName}" required />
									</div>
									<div class="form-group">
										<label for="email">이메일</label>
										<input type="email" name="email" class="form-control" id="email"
											value="${sessionScope.email}" required />
									</div>
									<div class="form-group">
										<label for="phone">휴대폰번호</label>
										<input type="text" name="phone" class="form-control" id="phone"
											value="${sessionScope.phone}" required />
									</div>
		
									<!-- 주소 api -->
									<div class="row">
									    <div class="col col-sm-12 col-md-12 col-lg-6 m-0">
									        <div class="form-group">
									            <label for="post">우편번호</label>
									            <input type="text" name="post" class="form-control" id="sample6_postcode"
									                   placeholder="우편번호" value="${sessionScope.post1}" />
									        </div>
									    </div>
									    <div class="col col-sm-12 col-md-12 col-lg-6 m-0 d-flex align-items-end">
									        <div class="form-group">
									            <label for="post"> </label>
									            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
									                   name="post" class="form-control" id="post"
									                   style="background-color: #007bff; color: white; border: 1px solid #007bff;" />
									        </div>
									    </div>
									</div>
		
									<div class="form-group">
										<label for="address1"></label>
										<input type="text" name="address1" class="form-control" id="sample6_address"
											placeholder="주소" value="${sessionScope.addre1}" required />
									</div>
									<div class="row">
										<div class="col col-sm-12 col-md-12 col-lg-6 m-0">
											<div class="form-group">
												<label for="address2"> </label>
												<input type="text" placeholder="참고항목" name="address2" class="form-control"
													id="sample6_extraAddress" value="${sessionScope.addre2}" required />
											</div>
		
										</div>
										<div class="col col-sm-12 col-md-12 col-lg-6 m-0">
											<div class="form-group">
												<label for="address3"></label>
												<input type="text" name="address3" class="form-control"
													id="sample6_detailAddress" placeholder="상세주소" value="${sessionScope.addre3}"
													required />
											</div>
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary register_btn w-100">회원 정보 수정</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div
						class="col col-sm-12 col-md-12 col-lg-3 m-0 p-0 w-100 h-100 accounts_col">
						<!--accounts_image-->
					</div>
				</div>
			</section>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		    <script>
		        function sample6_execDaumPostcode() {
		            new daum.Postcode({
		                oncomplete: function(data) {
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
		                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		                            extraAddr += data.bname;
		                        }
		                        // 건물명이 있고, 공동주택일 경우 추가한다.
		                        if (data.buildingName !== '' && data.apartment === 'Y') {
		                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                        }
		                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                        if (extraAddr !== '') {
		                            extraAddr = ' (' + extraAddr + ')';
		                        }
		                        // 조합된 참고항목을 해당 필드에 넣는다.
		                        document.getElementById("sample6_extraAddress").value = extraAddr;
		
		                    } else {
		                        document.getElementById("sample6_extraAddress").value = '';
		                    }
		
		                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                    document.getElementById('sample6_postcode').value = data.zonecode;
		                    document.getElementById("sample6_address").value = addr;
		                    // 커서를 상세주소 필드로 이동한다.
		                    document.getElementById("sample6_detailAddress").focus();
		                }
		            }).open();
		        }
		    </script>
		</div>
	</div>
</header>
</html>
