/**
 * 
 */
function loadCart(){
 fetch('cartList.do', {
	 method: 'POST',
         headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
         },
         body: 'logId=' + logId
    }) 
    .then(response => {
        if (response.redirected) { // 리다이렉션 여부 확인
            alert("로그인이 필요합니다.");
            location.href = 'loginForm.do'; // 로그인 페이지로 리다이렉트
            return; // 함수 종료
        }
        return response.json(); // 리다이렉션이 아니면 텍스트로 변환
    })
	.then(data => {
        const cartItemsContainer = document.getElementById('cartItems');
        cartItemsContainer.innerHTML = ''; // 기존 목록 초기화
		

        data.data.forEach(item => {
			const itemTotalPrice  = item.pdPrice * item.quantity; // 각 item 객체에 totalPrice 속성 추가
			console.log(item.pdPrice);
			console.log(item.quantity);
			const cartItemHtml = `
			    <li class="list-group-item d-flex justify-content-between align-items-center" data-cart-no="${item.cartNo}" data-total-price="${itemTotalPrice }">
			        <input type="checkbox" class="form-check-input cart-checkbox" value="${item.cartNo}" style="margin-right: 10px;" onchange="updateTotalPrice()"/>
			        <div class="flex-grow-1 text-center">
			            <h6 class="my-0">${item.pdName}</h6>
			            <img src="images/${item.pdImg}" style="width: 50px; height: 50px;">
			            <small class="text-body-secondary">수량: ${item.quantity} - 금액: ${item.totalPrice.toLocaleString()}원</small>
			        </div>
			    </li>
			`;
            cartItemsContainer.insertAdjacentHTML('beforeend', cartItemHtml);
        });

        // 총 가격 표시
        const totalItemHtml = `
            <li class="list-group-item d-flex justify-content-between">
                <span>총합계</span>
                <strong id="totalPrice">0원</strong>
            </li>
        `;
        cartItemsContainer.insertAdjacentHTML('beforeend', totalItemHtml);
		
		updateTotalPrice();

        // 버튼 이벤트 추가
        document.getElementById('orderSelected').addEventListener('click', orderSelectedItems);
        document.getElementById('orderAll').addEventListener('click', orderAllItems);
		document.getElementById('deleteSelected').addEventListener('click', deleteSelectedItems); // 삭제 버튼 이벤트 추가
    })
    .catch(error => {
        console.error('장바구니 목록을 불러오는 데 실패했습니다.', error);
    });
	
}

function orderSelectedItems() {
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);
    
    if (selectedItems.length > 0) {
        // 선택된 상품 주문 처리 (예: 서버에 요청)
        console.log('선택된 상품 IDs:', selectedItems);
        // 여기서 주문 요청을 서버에 보낼 수 있습니다.
    } else {
        alert('선택된 상품이 없습니다.');
    }
}

function orderAllItems() {
    // 전체 상품 주문 처리 (예: 서버에 요청)
    console.log('전체 상품 주문');
    // 여기서 전체 주문 요청을 서버에 보낼 수 있습니다.
}

function deleteSelectedItems() {
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);

    if (selectedItems.length > 0) {
        // 선택된 상품 삭제 처리 (예: 서버에 요청)
        console.log('선택된 상품 IDs:', selectedItems);
        // 여기서 삭제 요청을 서버에 보낼 수 있습니다.

        // 삭제 후 장바구니 다시 로드
		selectedItems.forEach(cartNo => {
            const itemToRemove = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"]`);
			console.log(itemToRemove);
            if (itemToRemove) {
                itemToRemove.remove(); // UI에서 상품 항목 제거
            }
        });
        alert('선택된 상품이 삭제되었습니다.');
    } else {
        alert('선택된 상품이 없습니다.');
    }
}

function updateTotalPrice() {
    let totalPrice = 0;
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'));

    selectedItems.forEach(checkbox => {
        const cartNo = checkbox.value;
        const item = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"]`);

        if (item) {
            if (checkbox.checked) {
                // data-total-price 속성에서 가격 정보를 가져옵니다.
                const itemTotalPrice = parseFloat(item.dataset.totalPrice);

                if (!isNaN(itemTotalPrice)) {
                    totalPrice += itemTotalPrice;
                } else {
                    console.error(`cartNo ${cartNo}에 해당하는 상품의 가격 정보가 유효하지 않습니다.`);
                }
            }
        } else {
            console.error(`cartNo ${cartNo}에 해당하는 상품을 찾을 수 없습니다.`);
        }
    });

    const formattedTotalPrice = totalPrice.toLocaleString();
    const totalPriceElement = document.getElementById('totalPrice');
    if (totalPriceElement) {
        totalPriceElement.textContent = `${formattedTotalPrice}원`;
    } else {
        console.error('totalPrice 요소를 찾을 수 없습니다.');
    }
}

