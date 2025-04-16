<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">관리자 대시보드</h1>
    <p class="mb-4">좌측 메뉴를 클릭하면 해당 콘텐츠가 표시됩니다.</p>

    <!-- 상품 관리 -->
    <c:if test="${param.menu eq 'product'}">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-primary text-white">
                    <div class="card-body">상품 목록</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">이동</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-primary text-white">
                    <div class="card-body">상품 전체 보기</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">이동</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-primary text-white">
                    <div class="card-body">입고/재고 관리</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">이동</a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 회원 관리 -->
    <c:if test="${param.menu eq 'member'}">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-warning text-white">
                    <div class="card-body">전체 회원</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">조회</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-warning text-white">
                    <div class="card-body">회원 정보</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">조회</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-warning text-white">
                    <div class="card-body">회원 삭제</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">삭제</a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 주문 관리 -->
    <c:if test="${param.menu eq 'order'}">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-success text-white">
                    <div class="card-body">주문 목록</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">보기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-success text-white">
                    <div class="card-body">배송 관리</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">관리</a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 리뷰/신고 관리 -->
    <c:if test="${param.menu eq 'review'}">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-danger text-white">
                    <div class="card-body">리뷰 목록</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">관리</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-danger text-white">
                    <div class="card-body">신고 처리</div>
                    <div class="card-footer">
                        <a class="text-white" href="#">처리</a>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 기본 안내 -->
    <c:if test="${empty param.menu}">
        <p>좌측 메뉴에서 항목을 선택해주세요.</p>
    </c:if>
</div>
