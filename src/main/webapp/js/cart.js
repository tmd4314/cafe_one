/**
 *
 */
let cartItems = []; // 전역 변수로 선언

function loadCart() {
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
        return response.json();
    })
    .then(data => {
        cartItems = data.data; // 서버에서 받아온 데이터를 cartItems에 할당
        const cartItemsContainer = document.getElementById('cartItems');
        cartItemsContainer.innerHTML = ''; // 기존 목록 초기화

        cartItems.forEach(item => { // cartItems 배열 사용
            const itemTotalPrice = item.pdPrice * item.quantity;
            const cartItemHtml = `
                <li class="list-group-item d-flex justify-content-between align-items-center" data-cart-no="${item.cartNo}" data-total-price="${itemTotalPrice}">
                    <input type="checkbox" class="form-check-input cart-checkbox" value="${item.cartNo}" style="margin-right: 10px;" onchange="updateTotalPrice()"/>
                    <div class="flex-grow-1 text-center">
                        <h6 class="my-0" style="color: black;">${item.pdName}</h6>
                        <img src="images/${item.pdImg}" style="width: 50px; height: 50px;">
                        <div class="quantity-controls">
                            <button class="btn btn-sm btn-outline-secondary quantity-decrease" data-cart-no="${item.cartNo}">-</button>
                            <span class="quantity" style="color: black;">${item.quantity}</span>
                            <button class="btn btn-sm btn-outline-secondary quantity-increase" data-cart-no="${item.cartNo}">+</button>
                        </div>
                        <small class="text-body-secondary" style="color: black;"> 금액: ${itemTotalPrice.toLocaleString()}원</small>
                    </div>
                    <button class="btn btn-sm btn-primary update-quantity-on-server" data-cart-no="${item.cartNo}">수정</button>
                </li>
            `;
            cartItemsContainer.insertAdjacentHTML('beforeend', cartItemHtml);
        });

        // 총 가격 표시
        const totalItemHtml = `
            <li class="list-group-item d-flex justify-content-between">
                <span style="color: black;">총합계</span>
                <strong id="totalPrice">0원</strong>
            </li>
        `;
        cartItemsContainer.insertAdjacentHTML('beforeend', totalItemHtml);

        updateTotalPrice();

        // 버튼 이벤트 추가
        document.getElementById('orderSelected').addEventListener('click', orderSelectedItems);
        document.getElementById('deleteSelected').addEventListener('click', deleteSelectedItems); // 삭제 버튼 이벤트 추가
		
		const selectAllCheckbox = document.getElementById('selectAll');
        const cartCheckboxes = document.querySelectorAll('.cart-checkbox');

        selectAllCheckbox.addEventListener('click', function() {
            const isChecked = selectAllCheckbox.checked;
            cartCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });
            updateTotalPrice(); // 총 가격 업데이트
        });

        // 개별 체크박스 이벤트 추가
        cartCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('click', function() {
                updateTotalPrice(); // 개별 선택 시 총 가격 업데이트
                // 모든 체크박스가 선택되었는지 확인하고 전체 선택 체크박스 업데이트
                const allChecked = Array.from(cartCheckboxes).every(checkbox => checkbox.checked);
                selectAllCheckbox.checked = allChecked;
            });
        });
    })
    .catch(error => {
        console.error('장바구니 목록을 불러오는 데 실패했습니다.', error);
    });
}

function orderSelectedItems() {
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);

    if (selectedItems.length > 0) {
		
		const data = {
			logId: logId,
			cartNoList: selectedItems
		};
		
		const formData = new URLSearchParams(); //cartNoList 정의
		for (const key in data){
			if(Array.isArray(data[key])){
				data[key].forEach(item => {
					formData.append(key, item)
				});
			} else{
				formData.append(key, data[key]);
			}
		}
		
		fetch('cashForm.do', {
			method: 'POST',
			headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
			body: formData.toString()
		})
		.then(response => {
			if (response.redirected) { // 리다이렉션 여부 확인
                alert("로그인이 필요합니다.");
                location.href = 'loginForm.do'; // 로그인 페이지로 리다이렉트
                return; // 함수 종료
            }
             return response.text(); // 응답 텍스트를 반환
		})
		.then(data => {
            // 응답 텍스트를 처리 (필요한 경우)
			const paymentUrl = 'cashForm.do?' + formData.toString(); // 서버에서 생성된 URL로 변경

            // 결제 페이지로 이동
            location.href = paymentUrl;
        })
		.catch(error => {
			console.error('에러 발생:', error);
		})
    } else {
        alert('선택된 상품이 없습니다.');
    }
}

function deleteSelectedItems() {
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);

    if (selectedItems.length > 0) {
        // 선택된 상품 삭제 처리 (예: 서버에 요청)
        //console.log('선택된 상품 IDs:', selectedItems);
        // 여기서 삭제 요청을 서버에 보낼 수 있습니다.
        let cartNo = selectedItems.join(',');
        console.log(cartNo);
        fetch(`cartDelete.do?cno=${cartNo}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json(); // 또는 response.text(), 서버 응답 형식에 따라
            })
            .then(data => {
                selectedItems.forEach(cartNo => {
                    const itemToRemove = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"]`);
                    console.log(itemToRemove);
                    if (itemToRemove) {
                        itemToRemove.remove(); // UI에서 상품 항목 제거
                    }
                });
                alert('선택된 상품이 삭제되었습니다.');
                loadCart(); // 삭제 후 장바구니 다시 로드
            })
            .catch(error => {
                console.error('장바구니 목록을 불러오는 데 실패했습니다.', error);
            });
        // 삭제 후 장바구니 다시 로드

    } else {
        alert('선택된 상품이 없습니다.');
    }
}

function updateTotalPrice() {
    let totalPrice = 0;
    const selectedItems = Array.from(document.querySelectorAll('#cartItems input[type="checkbox"]:checked'));

    selectedItems.forEach(checkbox => {
        const cartNo = checkbox.value;
        const itemElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"]`); // Element로 가져옴

        if (itemElement) {
            if (checkbox.checked) {
                // data-total-price 속성에서 가격 정보를 가져옵니다.
                const itemTotalPrice = parseFloat(itemElement.dataset.totalPrice);

                if (itemTotalPrice != null) {
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

function updateQuantityOnServer(cartNo, newQuantity) { // newQuantity 파라미터 추가
    fetch(`updateCart.do?cno=${cartNo}&qan=${newQuantity}`, { // 실제 서버 API 엔드포인트로 변경
        method: 'POST', // 또는 'PUT' 등 서버 API에 맞는 방식
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json(); // 또는 response.text()
    })
    .then(data => {
        console.log(`Cart item ${cartNo} quantity updated to ${newQuantity}:`, data);
        alert('수량이 수정되었습니다.');

        // 장바구니 데이터 업데이트
		const quantityElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"] .quantity`);
	    if (quantityElement) {
	        quantityElement.textContent = newQuantity;
	    }

		loadCart();
        updateTotalPrice(); // 총 가격 업데이트
    })
    .catch(error => {
        console.error(`Cart item ${cartNo} quantity update failed:`, error);
        alert(`수량 수정 실패: ${error}`);
        // UI를 이전 상태로 되돌리는 로직 추가 (선택 사항)
    });
}

document.addEventListener('click', function(event) {
    if (event.target.classList.contains('quantity-decrease')) {
        // 수량 감소 버튼 클릭
        const cartNo = event.target.dataset.cartNo;
        const quantityElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"] .quantity`);
        let currentQuantity = parseInt(quantityElement.textContent);
        let newQuantity = currentQuantity - 1;

        // 최소 수량 제한
        if (newQuantity < 1) {
            newQuantity = 1;
            alert("최소 수량은 1개입니다.");
            return;
        }

        quantityElement.textContent = newQuantity; // UI 업데이트
		updateItemTotalPrice(cartNo, newQuantity); // UI 금액 업데이트
    } else if (event.target.classList.contains('quantity-increase')) {
        // 수량 증가 버튼 클릭
        const cartNo = event.target.dataset.cartNo;
        const quantityElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"] .quantity`);
        let currentQuantity = parseInt(quantityElement.textContent);
        let newQuantity = currentQuantity + 1;

        quantityElement.textContent = newQuantity; // UI 업데이트
		updateItemTotalPrice(cartNo, newQuantity); // UI 금액 업데이트
    } else if (event.target.classList.contains('update-quantity-on-server')) {
        // 수정 버튼 클릭
        const cartNo = event.target.dataset.cartNo;
        const quantityElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"] .quantity`);
        let newQuantity = parseInt(quantityElement.textContent); // 최종 수량 가져오기
        updateQuantityOnServer(cartNo, newQuantity); // 서버에 최종 수량 전송
    }
	
	function updateItemTotalPrice(cartNo, newQuantity) {
	    // 해당 cartNo에 대한 상품 정보 찾기
	    const item = cartItems.find(item => item.cartNo === parseInt(cartNo));

	    if (item) {
	        const itemTotalPrice = item.pdPrice * newQuantity;
	        const itemElement = document.querySelector(`#cartItems li[data-cart-no="${cartNo}"]`);
	        
	        // 금액 업데이트
	        const priceElement = itemElement.querySelector('.text-body-secondary');
	        priceElement.textContent = ` 금액: ${itemTotalPrice.toLocaleString()}원`;

	        // data-total-price 속성 업데이트
	        itemElement.dataset.totalPrice = itemTotalPrice;

	        updateTotalPrice(); // 총 가격 업데이트
	    }
	}
});

