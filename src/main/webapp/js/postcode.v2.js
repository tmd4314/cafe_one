<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
			<input type="text" id="sample3_postcode" placeholder="우편번호">
			<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample3_address" placeholder="주소"><br>
			<input type="text" id="sample3_detailAddress" placeholder="상세주소">
			<input type="text" id="sample3_extraAddress" placeholder="참고항목">

			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>

			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    var element_wrap = document.getElementById('wrap');

			    function foldDaumPostcode() {
			        element_wrap.style.display = 'none';
			    }

			    function sample3_execDaumPostcode() {
			        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var addr = '';
			                var extraAddr = '';

			                if (data.userSelectedType === 'R') {
			                    addr = data.roadAddress;
			                } else {
			                    addr = data.jibunAddress;
			                }

			                if(data.userSelectedType === 'R'){
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    document.getElementById("sample3_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample3_extraAddress").value = '';
			                }

			                document.getElementById('sample3_postcode').value = data.zonecode;
			                document.getElementById("sample3_address").value = addr;
			                document.getElementById("sample3_detailAddress").focus();

			                element_wrap.style.display = 'none';

			                document.body.scrollTop = currentScroll;
			            },
			            onresize : function(size) {
			                element_wrap.style.height = size.height+'px';
			            },
			            width : '100%',
			            height : '100%'
			        }).embed(element_wrap);

			        element_wrap.style.display = 'block';
			    }
			</script>
        }
    }).open();
</script>