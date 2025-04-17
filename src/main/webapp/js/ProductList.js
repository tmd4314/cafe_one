/**
 * ProductList.js
 */

// 이달의 상품 시작
$(document).ready(function () {
  $('.product-list').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    infinite: true,
    arrows: true,
    dots: false,
    responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1
        }
      }
    ]
  });
});
// 이달의 상품 끝

// 신상품 시작
// JS가 필요한 경우를 위해 초기화
document.addEventListener('DOMContentLoaded', function () {
  console.log('상품 리스트 로딩 완료');
});
// 신상품 끝

// 할인상품 시작
document.addEventListener('DOMContentLoaded', () => {
  const cartButtons = document.querySelectorAll('.btn_list_cart');
  const cartLayer = document.getElementById('addCartLayer');
  const closeBtn = cartLayer.querySelector('.close');
  const cancelBtn = cartLayer.querySelector('.btn_cancel');

  cartButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      cartLayer.classList.remove('hidden');
    });
  });

  [closeBtn, cancelBtn].forEach(btn => {
    btn.addEventListener('click', () => {
      cartLayer.classList.add('hidden');
    });
  });
});
// 할인상품 끝
// 장바구니 추가 시작
// 장바구니 팝업 열기
function showCartLayer() {
  document.getElementById('addCartLayer').classList.remove('hidden');
}

// 장바구니 팝업 닫기
function hideCartLayer() {
  document.getElementById('addCartLayer').classList.add('hidden');
}

// 이벤트 바인딩
document.addEventListener('DOMContentLoaded', () => {
  const cancelBtn = document.querySelector('.btn-cancel');
  const confirmBtn = document.querySelector('.btn-confirm');
  const closeBtn = document.querySelector('.btn-close');

  cancelBtn.addEventListener('click', hideCartLayer);
  closeBtn.addEventListener('click', hideCartLayer);
  confirmBtn.addEventListener('click', () => {
    window.location.href = '/cart'; // 장바구니 페이지로 이동
  });
});

// 장바구니 추가 끝