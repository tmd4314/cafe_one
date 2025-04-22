<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <title>커피 한 잔</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="author" content="">
  <meta name="keywords" content="">
  <meta name="description" content="">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/vendor.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
    rel="stylesheet">
</head>

<body>
  <section>
    <div class="slideshow-container">
      <div class="mySlides"><img src="images/c200.png" alt="커피1"></div>
      <div class="mySlides"><img src="images/c300.png" alt="커피2"></div>
      <div class="mySlides"><img src="images/c400.png" alt="커피3"></div>
      <div class="mySlides"><img src="images/c500.png" alt="커피4"></div>


      <div class="slide-indicator">
        <div class="indicator-line">
          <div class="active-indicator"></div>
        </div>
        <!-- 슬라이드 버튼 추가 -->
        <div class="slide-btns">
          <button class="slide-btn" data-slide="0"></button>
          <button class="slide-btn" data-slide="1"></button>
          <button class="slide-btn" data-slide="2"></button>
          <button class="slide-btn" data-slide="3"></button>
        </div>
      </div>
    </div>
  </section>

  <section class="pb-5">
    <div class="container-lg">
      <div class="row">
        <div class="col-md-12">
          <div class="section-header d-flex flex-wrap justify-content-between my-4">
            <h2 class="section-title">⭐베스트 상품</h2>
            <div class="d-flex align-items-center">
              <!-- 카테고리 버튼 -->
              <div class="row mb-4">
                <div class="col-md-12">
                  <div class="category-buttons d-flex justify-content-center">
                    <div class="category-buttons d-flex justify-content-center">
                      <a href="?categoryCode=CO" class="btn btn-outline-secondary mx-1">커피</a>
                      <a href="?categoryCode=SF" class="btn btn-outline-secondary mx-1">시럽/소스</a>
                      <a href="?categoryCode=PD" class="btn btn-outline-secondary mx-1">파우더</a>
                      <a href="?categoryCode=UZ" class="btn btn-outline-secondary mx-1">유제품</a>
                    </div>
                    <!-- 
                    <button class="btn btn-outline-secondary mx-1" onclick="filterProducts('CO')">커피</button>
                    <button class="btn btn-outline-secondary mx-1" onclick="filterProducts('SF')">시럽/소스</button>
                    <button class="btn btn-outline-secondary mx-1" onclick="filterProducts('PD')">파우더</button>
                    <button class="btn btn-outline-secondary mx-1" onclick="filterProducts('UZ')">유제품</button>                    
                     -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row product-grid">
        <c:choose>
          <c:when test="${param.categoryCode == NULL}">
            <c:forEach var="pdList" items="${bList}">
              <div class="col-md-4 product-item ">
                <figure>
                  <a href="product.do?pdCode=${pdList.pdCode}" title="Product 1">
                    <img src="images/${pdList.pdimg}" alt="${pdList.pdName}" class="tab-image">
                  </a>
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${pdList.pdName}</h3>
                  <div>
                    <span class="rating">${pdList.pdScore} / 10</span>
                    <span>(재고 : ${pdList.pdStock})</span>
                  </div>
                  <div class="button-area p-3 pt-0">
                    <div class="row g-1 mt-2">
                      <div class="col-3"><input type="number" name="quantity"
                          class="form-control border-dark-subtle input-number quantity" value="1"></div>
                      <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart">Add to Cart</a>
                      </div>
                      <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6">❤️</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>

          <c:when test="${param.categoryCode == 'CO'}">

            <c:forEach var="pdList" items="${bCOList}">
              <div class="col-md-4 product-item ">
                <figure>
                  <a href="product.do?pdCode=${pdList.pdCode}" title="Product 1">
                    <img src="images/${pdList.pdimg}" alt="${pdList.pdName}" class="tab-image">
                  </a>
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${pdList.pdName}</h3>
                  <div>
                    <span class="rating">${pdList.pdScore} / 10</span>
                    <span>(재고 : ${pdList.pdStock})</span>
                  </div>
                  <div class="button-area p-3 pt-0">
                    <div class="row g-1 mt-2">
                      <div class="col-3"><input type="number" name="quantity"
                          class="form-control border-dark-subtle input-number quantity" value="1"></div>
                      <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart">Add to Cart</a>
                      </div>
                      <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6">❤️</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>

          </c:when>
          <c:when test="${param.categoryCode == 'SF'}">
            <c:forEach var="pdList" items="${bSFList }">
              <div class="col-md-4 product-item ">
                <figure>
                  <a href="product.do?pdCode=${pdList.pdCode}" title="Product 1">
                    <img src="images/${pdList.pdimg}" alt="${pdList.pdName}" class="tab-image">
                  </a>
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${pdList.pdName}</h3>
                  <div>
                    <span class="rating">${pdList.pdScore} / 10</span>
                    <span>(재고 : ${pdList.pdStock})</span>
                  </div>
                  <div class="button-area p-3 pt-0">
                    <div class="row g-1 mt-2">
                      <div class="col-3"><input type="number" name="quantity"
                          class="form-control border-dark-subtle input-number quantity" value="1"></div>
                      <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart">Add to Cart</a>
                      </div>
                      <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6">❤️</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:when test="${param.categoryCode == 'PD'}">
            <c:forEach var="pdList" items="${bPDList}">
              <div class="col-md-4 product-item ">
                <figure>
                  <a href="product.do?pdCode=${pdList.pdCode}" title="Product 1">
                    <img src="images/${pdList.pdimg}" alt="${pdList.pdName}" class="tab-image">
                  </a>
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${pdList.pdName}</h3>
                  <div>
                    <span class="rating">${pdList.pdScore} / 10</span>
                    <span>(재고 : ${pdList.pdStock})</span>
                  </div>
                  <div class="button-area p-3 pt-0">
                    <div class="row g-1 mt-2">
                      <div class="col-3"><input type="number" name="quantity"
                          class="form-control border-dark-subtle input-number quantity" value="1"></div>
                      <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart">Add to Cart</a>
                      </div>
                      <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6">❤️</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:when test="${param.categoryCode == 'UZ'}">
            <c:forEach var="pdList" items="${bUZList}">
              <div class="col-md-4 product-item ">
                <figure>
                  <a href="product.do?pdCode=${pdList.pdCode}" title="Product 1">
                    <img src="images/${pdList.pdimg}" alt="${pdList.pdName}" class="tab-image">
                  </a>
                </figure>
                <div class="d-flex flex-column text-center">
                  <h3 class="fs-6 fw-normal">${pdList.pdName}</h3>
                  <div>
                    <span class="rating">${pdList.pdScore} / 10</span>
                    <span>(재고 : ${pdList.pdStock})</span>
                  </div>
                  <div class="button-area p-3 pt-0">
                    <div class="row g-1 mt-2">
                      <div class="col-3"><input type="number" name="quantity"
                          class="form-control border-dark-subtle input-number quantity" value="1"></div>
                      <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart">Add to Cart</a>
                      </div>
                      <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6">❤️</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>



      <!-- / product-grid -->
    </div>
  </section>


  <section id="latest-products" class="products-carousel">
    <div class="container-lg overflow-hidden pb-5">
      <div class="row">
        <div class="col-md-12">

          <div class="section-header d-flex justify-content-between my-4">

            <h2 class="section-title">💬인기 리뷰상품</h2>

          </div>
        </div>
        <c:forEach var="product" items="${productList}">
          <div class="row">
            <div class="col-md-12">

              <div class="swiper">
                <div class="swiper-wrapper">

                  <div class="product-item swiper-slide">
                    <figure>
                      <a href="product.do?pdCode=${product.pdCode}" title="Product Title">
                        <img src="images/${product.pdimg }" alt="produtForm.jsp" class="tab-image">
                      </a>
                    </figure>
                    <div class="d-flex flex-column text-center">
                      <h3 class="fs-6 fw-normal">${product.pdName}</h3>
                      <div>
                        <span class="rating">
                          <svg width="18" height="18" class="text-warning">
                            <use xlink:href="#star-full"></use>
                          </svg>
                          <svg width="18" height="18" class="text-warning">
                            <use xlink:href="#star-full"></use>
                          </svg>
                          <svg width="18" height="18" class="text-warning">
                            <use xlink:href="#star-full"></use>
                          </svg>
                          <svg width="18" height="18" class="text-warning">
                            <use xlink:href="#star-full"></use>
                          </svg>
                          <svg width="18" height="18" class="text-warning">
                            <use xlink:href="#star-half"></use>
                          </svg>
                        </span>
                        <span>(222)</span>
                      </div>
                      <div class="d-flex justify-content-center align-items-center gap-2">

                        <span class="text-dark fw-semibold">${product.pdPrice }</span>

                      </div>
                      <div class="button-area p-3 pt-0">
                        <div class="row g-1 mt-2">
                          <div class="col-3"><input type="number" name="quantity"
                              class="form-control border-dark-subtle input-number quantity" value="1"></div>
                          <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"><svg
                                width="18" height="18">
                                <use xlink:href="#cart"></use>
                              </svg> Add to Cart</a></div>
                          <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6"><svg width="18"
                                height="18">
                                <use xlink:href="#heart"></use>
                              </svg></a></div>
                        </div>
                      </div>
                    </div>
                  </div>
        </c:forEach>

      </div>
    </div>
    <!-- / products-carousel -->

    </div>
    </div>
    </div>
  </section>

  <section id="latest-blog" class="pb-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="blog-slider">
            <div class="blog-slide">
              <img src="images/c01.png" alt="Blog Post 1">
            </div>
            <div class="blog-slide">
              <img src="images/c02.png" alt="Blog Post 2">
            </div>
            <div class="blog-slide">
              <img src="images/c03.png" alt="Blog Post 3" style="border-radius: 50%;">
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
  <script>
    let slideIndex = 0;
    let slideTimer;

    function showSlides(manual = false) {
      const slides = document.getElementsByClassName("mySlides");
      const buttons = document.getElementsByClassName("slide-btn");
      const activeIndicator = document.querySelector(".active-indicator");

      // 모든 슬라이드 숨김
      for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
        buttons[i].classList.remove("active");
      }

      // 인덱스 증가
      if (!manual) slideIndex++;
      if (slideIndex >= slides.length) slideIndex = 0;

      // 현재 슬라이드 표시
      slides[slideIndex].classList.add("active");
      buttons[slideIndex].classList.add("active");

      // 인디케이터 위치 조정
      const indicatorWidth = 100 / slides.length;
      activeIndicator.style.left = `${indicatorWidth * slideIndex}%`;

      // 타이머 재설정
      clearTimeout(slideTimer);
      slideTimer = setTimeout(showSlides, 7000); // 슬라이드 하나를 7초간 표시
    }

    // 버튼 클릭 시 수동 슬라이드
    document.querySelectorAll(".slide-btn").forEach((button, index) => {
      button.addEventListener("click", () => {
        slideIndex = index;
        showSlides(true);
      });
    });

    // 최초 실행
    window.onload = showSlides;

    function filterProducts(category) {
      const products = document.querySelectorAll('.product-item');
      products.forEach(product => {
        if (category === 'CO' || product.classList.contains(category)) {
          product.style.display = 'block';
        } else if (category === 'SF') {
          product.style.display = 'block';
        } else if (category === 'PD') {
          product.style.display = 'block';
        } else if (category === 'UZ') {
          product.style.display = 'block';
        } else {
          product.style.display = 'none';
        }
      });
    }
  </script>



</body>

</html>