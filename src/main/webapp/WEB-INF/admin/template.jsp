<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@7.0.7/dist/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a2d2706b52.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

<!-- 상단 네비게이션 바 -->
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="#">Admin</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item">
            <span class="text-white">
                <c:choose>
                    <c:when test="${not empty sessionScope.adminName}">
                        ${sessionScope.adminName}님 로그인됨
                    </c:when>
                    <c:otherwise>관리자 로그인됨</c:otherwise>
                </c:choose>
            </span>
        </li>
    </ul>
</nav>

<div id="layoutSidenav">
    <!-- 좌측 사이드바 -->
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMember">
                        전체 회원
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseMember">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="#">회원 정보</a>
                            <a class="nav-link" href="#">회원 수정</a>
                            <a class="nav-link" href="#">회원 삭제</a>
                        </nav>
                    </div>
	 				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseProduct">
				                        상품 관리
				                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				                    </a>
				                    <div class="collapse" id="collapseProduct">
				                        <nav class="sb-sidenav-menu-nested nav accordion">
				                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseList">
				                                상품 목록 
				                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				                            </a>
				                            <div class="collapse" id="collapseList">
				                                <nav class="sb-sidenav-menu-nested nav">
				                                    <a class="nav-link" href="#">상품 전체 보기</a>
				                                    <a class="nav-link" href="#">상품 검색</a>
				                                </nav>
				                            </div>
				                            <a class="nav-link" href="#">입고/재고 관리</a>
				                            <a class="nav-link" href="#">상품 등록</a>
				                        </nav>
				                    </div>
				                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrder">
				                        주문 관리
				                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				                    </a>
				                    <div class="collapse" id="collapseOrder">
				                        <nav class="sb-sidenav-menu-nested nav">
				                            <a class="nav-link" href="#">주문 목록</a>
				                            <a class="nav-link" href="#">주문 검색</a>
				                            <a class="nav-link" href="#">배송 관리</a>
				                            <a class="nav-link" href="#">환불/취소 요청</a>
				                        </nav>
				                    </div>			                   

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseReview">
                        리뷰/신고 관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseReview">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="#">상품 리뷰 관리</a>
                            <a class="nav-link" href="#">리뷰 신고 처리</a>
                            <a class="nav-link" href="#">1:1 문의 관리</a>
                        </nav>
                    </div>

                    <div class="sb-sidenav-menu-heading">운영 관리</div>
                    <a class="nav-link" href="#">관리자 등록</a>
                    <a class="nav-link" href="#">접속 로그 차트</a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                <c:out value="${sessionScope.adminName != null ? sessionScope.adminName : '관리자'}" />
            </div>
        </nav>
    </div>

    <!-- 본문 영역 (Tiles body 삽입) -->
    <div id="layoutSidenav_content">
        <main class="container-fluid px-4 mt-4">
            <tiles:insertAttribute name="body" />
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">© Your Admin Panel 2025</div>
                    <div>
                        <a href="#">Privacy Policy</a> ·
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<!-- JS -->
<script>
    window.addEventListener('DOMContentLoaded', event => {
        const sidebarToggle = document.body.querySelector('#sidebarToggle');
        if (sidebarToggle) {
            if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                document.body.classList.toggle('sb-sidenav-toggled');
            }
            sidebarToggle.addEventListener('click', event => {
                event.preventDefault();
                document.body.classList.toggle('sb-sidenav-toggled');
                localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
            });
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
