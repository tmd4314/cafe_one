<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
/* 푸터 스타일 */
.footer {
    margin-top: 150px;
    background-color: #d1b58a; /* 로고 배경과 동일한 색 */
    padding: 20px 0; /* 높이 줄임 */
    color: #fff; /* 흰색 텍스트 */
}

.footer-menu img {
    border-radius: 50%; /* 둥글게 만들기 */
    margin-bottom: 10px; /* 간격 조정 */
    width: 120px; /* 너비 조정 */
    height: 120px; /* 높이 조정 */
}

.footer-menu ul {
    list-style: none;
    padding: 0;
}

.footer-menu ul li {
    margin-bottom: 5px; /* 간격 줄임 */
}

.footer-menu ul li a {
    color: #fff; /* 흰색 링크 */
    text-decoration: none;
}

.footer-menu ul li a:hover {
    color: #e0e0e0; /* 링크 호버 색상 */
    text-decoration: underline;
}

#footer-bottom {
    background-color: #b89c6c; /* 푸터 바닥 색상 */
    padding: 10px 0; /* 높이 줄임 */
    font-size: 0.9em;
}

#footer-bottom a {
    color: #fff; /* 흰색 링크 */
    text-decoration: none;
}

#footer-bottom a:hover {
    color: #e0e0e0; /* 링크 호버 색상 */
    text-decoration: underline;
}

.copyright {
    text-align: left;
}

.credit-link {
    text-align: right;
}

/* 반응형 스타일 */
@media (max-width: 768px) {
    .copyright, .credit-link {
        text-align: center;
    }
}
</style>

<footer class="footer py-5">
    <div class="container-lg">
        <div class="row">
            <div class="col-md-4 footer-menu">
                <img src="images/logo.png" alt="로고">
                <p>안전하게 배송해 드립니다. 커피 한잔</p>
            </div>

            <div class="col-md-4 footer-menu">
                <h5>고객 지원</h5>
                <ul>
                    <li><a href="#">자주 묻는 질문 (FAQ)</a></li>
                    <li><a href="#">배송 안내</a></li>
                    <li><a href="#">교환 및 환불 정책</a></li>
                    <li><a href="#">문의하기</a></li>
                </ul>
            </div>

            <div class="col-md-4 footer-menu">
                <h5>회사 정보</h5>
                <ul>
                    <li><a href="#">회사 소개</a></li>
                    <li><a href="#">이용 약관</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">사업자 정보 확인</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<div id="footer-bottom">
    <div class="container-lg">
        <div class="row">
            <div class="col-md-6 copyright">
                <p>© 2024 Organic. All rights reserved.</p>
            </div>
            <div class="col-md-6 credit-link text-end">
                <a href="adminLoginForm.do" class="btn btn-sm btn-outline-light">관리자 로그인</a>
                <p>HTML Template by <a href="https://templatesjungle.com/">TemplatesJungle</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    var logId = "${logId}";
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/cart.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
