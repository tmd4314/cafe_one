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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/vendor.css">
    <link rel="stylesheet" type="text/css" href="style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  </head>
  <body>
    <section style="background-image: url('images/banner-1.jpg');background-repeat: no-repeat;background-size: cover;">
      <div class="container-lg">
        <div class="row">
          <div class="col-lg-6 pt-5 mt-5">
            <h2 class="display-1 ls-1"><span class="fw-bold text-primary">커피</span> 한 <span class="fw-bold">잔</span></h2>
            <p class="fs-4">서브 타이틀?</p>
            <div class="d-flex gap-3">
              <a href="#" class="btn btn-primary text-uppercase fs-6 rounded-pill px-4 py-3 mt-3">Start Shopping</a>
              <a href="#" class="btn btn-dark text-uppercase fs-6 rounded-pill px-4 py-3 mt-3">Join Now</a>
            </div>
            <div class="row my-5">
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto"><p class="fs-1 fw-bold lh-sm mb-0">ㅇㅅㅇ</p></div>
                  <div class="col"><p class="text-uppercase lh-sm mb-0">ㅇㅅㅇ1</p></div>
                </div>
              </div>
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto"><p class="fs-1 fw-bold lh-sm mb-0">ㅇㅅㅇ</p></div>
                  <div class="col"><p class="text-uppercase lh-sm mb-0">ㅇㅅㅇ2</p></div>
                </div>
              </div>
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto"><p class="fs-1 fw-bold lh-sm mb-0">ㅇㅅㅇ</p></div>
                  <div class="col"><p class="text-uppercase lh-sm mb-0">ㅇㅅㅇ3</p></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row row-cols-1 row-cols-sm-3 row-cols-lg-3 g-0 justify-content-center">
          <div class="col">
            <div class="card border-0 bg-primary rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60"><use xlink:href="#fresh"></use></svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">ㅇㅂㅇ</h5>
                    <p class="card-text">ㅇㅂㅇ1</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card border-0 bg-secondary rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60"><use xlink:href="#organic"></use></svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">ㅇㅂㅇ</h5>
                    <p class="card-text">ㅇㅂㅇ2</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card border-0 bg-danger rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60"><use xlink:href="#delivery"></use></svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">ㅇㅂㅇ</h5>
                    <p class="card-text">ㅇㅂㅇ3</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </section>

    <section class="py-5 overflow-hidden">
      <div class="container-lg">
        <div class="row">
          <div class="col-md-12">

            <div class="section-header d-flex flex-wrap justify-content-between mb-5">
              <h2 class="section-title">Category</h2>

              <div class="d-flex align-items-center">
                <a href="#" class="btn btn-primary me-2">(Category)View All</a>
                <div class="swiper-buttons">
                  <button class="swiper-prev category-carousel-prev btn btn-yellow">❮</button>
                  <button class="swiper-next category-carousel-next btn btn-yellow">❯</button>
                </div>
              </div>
            </div>
            
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">

            <div class="category-carousel swiper">
              <div class="swiper-wrapper">
                <a href="productInfo.do" class="nav-link swiper-slide text-center">
                  <img src="images/category-thumb-1.jpg" class="rounded-circle" alt="Category Thumbnail">
                  <h4 class="fs-6 mt-3 fw-normal category-title">Category1</h4>
                </a>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="pb-5">
      <div class="container-lg">

        <div class="row">
          <div class="col-md-12">

            <div class="section-header d-flex flex-wrap justify-content-between my-4">
              
              <h2 class="section-title">Best selling products</h2>

              <div class="d-flex align-items-center">
                <a href="#" class="btn btn-primary rounded-1">(Best selling products)View All</a>
              </div>
            </div>
            
          </div>
        </div>
        
        <div class="row">
          <div class="col-md-12">

            <div class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5">
                  
              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img src="images/product-thumb-1.png" alt="Product Thumbnail" class="tab-image">
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Best selling products1</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-half"></use></svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div class="d-flex justify-content-center align-items-center gap-2">
                      <del>$Best selling products1 할인 전</del>
                      <span class="text-dark fw-semibold">$Best selling products1 할인 후</span>
                      <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">n% 할인</span>
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3"><input type="number" name="quantity" class="form-control border-dark-subtle input-number quantity" value="1"></div>
                        <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"><svg width="18" height="18"><use xlink:href="#cart"></use></svg> Add to Cart</a></div>
                        <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6"><svg width="18" height="18"><use xlink:href="#heart"></use></svg></a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
            </div>
            <!-- / product-grid -->


          </div>
        </div>
      </div>
    </section>

    <section class="py-3">
      <div class="container-lg">
        <div class="row">
          <div class="col-md-12">

            <div class="banner-blocks">
            
              <div class="banner-ad d-flex align-items-center large bg-info block-1" style="background: url('images/banner-ad-1.jpg') no-repeat; background-size: cover;">
                <div class="banner-content p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Items on SALE</h3>
                    <p>Discounts up to 30%</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>
              
              <div class="banner-ad bg-success-subtle block-2" style="background:url('images/banner-ad-2.jpg') no-repeat;background-size: cover">
                <div class="banner-content align-items-center p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Combo offers</h3>
                    <p>Discounts up to 50%</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>

              <div class="banner-ad bg-danger block-3" style="background:url('images/banner-ad-3.jpg') no-repeat;background-size: cover">
                <div class="banner-content align-items-center p-5">
                  <div class="content-wrapper text-light">
                    <h3 class="banner-title text-light">Mileage</h3>
                    <p>My mileage</p>
                    <a href="#" class="btn-link text-white">Shop Now</a>
                  </div>
                </div>
              </div>

            </div>
            <!-- / Banner Blocks -->
              
          </div>
        </div>
      </div>
    </section>

    <section id="featured-products" class="products-carousel">
      <div class="container-lg overflow-hidden py-5">
        <div class="row">
          <div class="col-md-12">

            <div class="section-header d-flex flex-wrap justify-content-between my-4">
              
              <h2 class="section-title">Featured products</h2>

              <div class="d-flex align-items-center">
                <a href="#" class="btn btn-primary me-2">(Featured products)View All</a>
                <div class="swiper-buttons">
                  <button class="swiper-prev products-carousel-prev btn btn-primary">❮</button>
                  <button class="swiper-next products-carousel-next btn btn-primary">❯</button>
                </div>  
              </div>
            </div>
            
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">

            <div class="swiper">
              <div class="swiper-wrapper">
                                
                <div class="product-item swiper-slide">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img src="images/product-thumb-10.png" alt="Product Thumbnail" class="tab-image">
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Featured products1</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-half"></use></svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div class="d-flex justify-content-center align-items-center gap-2">
                      <del>$Featured products1 할인 전</del>
                      <span class="text-dark fw-semibold">$Featured products2 할인 후</span>
                      <span class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary">10% OFF</span>
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3"><input type="number" name="quantity" class="form-control border-dark-subtle input-number quantity" value="1"></div>
                        <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"><svg width="18" height="18"><use xlink:href="#cart"></use></svg> Add to Cart</a></div>
                        <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6"><svg width="18" height="18"><use xlink:href="#heart"></use></svg></a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / products-carousel -->

          </div>
        </div>
      </div>
    </section>


    <!-- 분기점 -->

    <section id="latest-products" class="products-carousel">
      <div class="container-lg overflow-hidden pb-5">
        <div class="row">
          <div class="col-md-12">

            <div class="section-header d-flex justify-content-between my-4">
              
              <h2 class="section-title">Just arrived</h2>

              <div class="d-flex align-items-center">
                <a href="#" class="btn btn-primary me-2">(Just arrived)View All</a>
                <div class="swiper-buttons">
                  <button class="swiper-prev products-carousel-prev btn btn-primary">❮</button>
                  <button class="swiper-next products-carousel-next btn btn-primary">❯</button>
                </div>  
              </div>
            </div>
            
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">

            <div class="swiper">
              <div class="swiper-wrapper">
                
                <div class="product-item swiper-slide">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img src="images/product-thumb-20.png" alt="Product Thumbnail" class="tab-image">
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Sunstar Fresh Melon Juice</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-full"></use></svg>
                        <svg width="18" height="18" class="text-warning"><use xlink:href="#star-half"></use></svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div class="d-flex justify-content-center align-items-center gap-2">

                      <span class="text-dark fw-semibold">$18.00</span>
                    
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3"><input type="number" name="quantity" class="form-control border-dark-subtle input-number quantity" value="1"></div>
                        <div class="col-7"><a href="#" class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"><svg width="18" height="18"><use xlink:href="#cart"></use></svg> Add to Cart</a></div>
                        <div class="col-2"><a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6"><svg width="18" height="18"><use xlink:href="#heart"></use></svg></a></div>
                      </div>
                    </div>
                  </div>
                </div>

                                  
              </div>
            </div>
            <!-- / products-carousel -->

          </div>
        </div>
      </div>
    </section>

    <section id="latest-blog" class="pb-4">
      <div class="container-lg">
        <div class="row">
          <div class="section-header d-flex align-items-center justify-content-between my-4">
            <h2 class="section-title">Our Recent Blog</h2>
            <a href="#" class="btn btn-primary">(Our Recent Blog)View All</a>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <article class="post-item card border-0 shadow-sm p-3">
              <div class="image-holder zoom-effect">
                <a href="#">
                  <img src="images/post-thumbnail-1.jpg" alt="post" class="card-img-top">
                </a>
              </div>
              <div class="card-body">
                <div class="post-meta d-flex text-uppercase gap-3 my-2 align-items-center">
                  <div class="meta-date"><svg width="16" height="16"><use xlink:href="#calendar"></use></svg>22 Aug 2021</div>
                  <div class="meta-categories"><svg width="16" height="16"><use xlink:href="#category"></use></svg>tips & tricks</div>
                </div>
                <div class="post-header">
                  <h3 class="post-title">
                    <a href="#" class="text-decoration-none">Top 10 casual look ideas to dress up your kids</a>
                  </h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipi elit. Aliquet eleifend viverra enim tincidunt donec quam. A in arcu, hendrerit neque dolor morbi...</p>
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>