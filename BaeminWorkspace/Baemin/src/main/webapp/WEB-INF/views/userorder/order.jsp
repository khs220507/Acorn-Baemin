<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}
.wrap-all{
	width: 75%;
	margin: 0 auto;
}
.section-order-title-inner{
	padding: 10px;
}
.line{
	border: 0px;
	height: 3px;
	background-color: #d9d9d9;
}
.input-tag{
	width: 250px;
}
.section-cart-box {
	width: 1200px;
	height: 800px;
}

.section-order-select {
	display: flex;
	border-bottom: 1px solid #d9d9d9;
	padding: 10px;
}

.section-select-ordertype {
	margin-right: 50px;
	font-size: 20px;
}

.section-order-address-wrap {
	border-bottom: 1px solid #d9d9d9;
	padding: 13px;
}
.section-order-address-citygu {
    margin: 5px 0;
}
.current-location-img {
	width: 20px;
}
.section-order-address-detail{
	width: 250px;
}
.section-order-phone-wrap {
	border-bottom: 3px solid #d9d9d9;
	padding: 13px;
}

.section-order-request-wrap {
	border-bottom: 3px solid #d9d9d9;
	padding: 13px;
}
.section-order-request-seller {
    line-height: 25px;
}
.section-order-request-title {
	font-size: 20px;
}

.section-order-paytype-wrap {
	padding: 13px;
	line-height: 28px;
}

.section-order-paytype-title {
	font-size: 20px;
}

.section-order-paytype-card-wrap {
	display: flex;
}

.section-order-paytype-cash {
	display: flex;
}

#paymentImageElement {
	width: 100px;
	background-color: #d9d9d9;
	border-radius: 10px;
	padding: 20px;
}

.section-order-price-title {
	font-size: 20px;
}

.section-order-price-wrap {
	border-top: 3px #d9d9d9 solid;
	border-bottom: 1px #d9d9d9 solid;
	padding: 13px;
	line-height: 25px;
}

.section-order-price-detail-wrap {
	display: flex;
	justify-content: space-between;
}

.section-order-price-detail-wrap-delivery {
	display: flex;
	justify-content: space-between;
}

.section-order-orderMenuPrice-wrap {
	display: flex;
	justify-content: space-between;
	border-bottom: 3px #d9d9d9 solid;
	padding: 13px;
}
.secion-order-totalPrice-title{
	font-size: 20px;
}
.section-order-orderMenuPrice {
	font-size: 20px;
}

.section-order-button-wrap {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

#order-button {
	margin: 5px;
	padding: 15px 30px;
	border-radius: 5px;
	font-size: 20px;
	background-color: #48D1CC;
	color: white;
	border: none;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						
						

						function updateTotalPaymentAmount() {
							var selectedOrderType = $(
									"input[name='orderType']:checked").val();
							var deliveryFee = parseInt("${storeInfo[0].deliveryFee}"); // Assuming delivery fee is a numeric value
							var orderMenuPrice = parseInt("${orderMenuPrice}");

							// Check if the selected order type is 'pickup'
							if (selectedOrderType === '1') {
								// If 'pickup', set delivery fee to 0
								deliveryFee = 0;
							}

							// Update the total amount and display
							var totalAmount = orderMenuPrice + deliveryFee;
							$(".section-order-orderMenuPrice").text(
									totalAmount + "원");
							$(".section-order-price-detail-amount-delivery")
									.text(deliveryFee + "원");
						}

						// Initial call to set the total payment amount based on the default selected order type
						updateTotalPaymentAmount();

						// Handle radio button change event
						$("input[name='orderType']").change(function() {
							updateTotalPaymentAmount(); // Update total payment amount when the order type changes
						});

						function toggleAddressWrapVisibility() {
							var selectedOrderType = $(
									"input[name='orderType']:checked").val();

							// Check if the selected order type is 'pickup'
							if (selectedOrderType === '1') {
								$('#address-wrap').hide(); // Hide the address wrap
							} else {
								$('#address-wrap').show(); // Show the address wrap for other order types
							}
						}

						// Initial call to set visibility based on the default selected order type
						toggleAddressWrapVisibility();

						// Handle radio button change event
						$("input[name='orderType']").change(function() {
							toggleAddressWrapVisibility(); // Toggle visibility when the order type changes
						});
						
						function updateDeliveryFee() {
					        var selectedOrderType = $("input[name='orderType']:checked").val();
					        var deliveryFeeInput = $("#deliveryFee");

					        // Check if the selected order type is 'pickup'
					        if (selectedOrderType === '1') {
					            // If 'pickup', set delivery fee to 0
					            deliveryFeeInput.val('0');
					        } else {
					            // If not 'pickup', use the original value from the server
					            deliveryFeeInput.val('${storeInfo[0].deliveryFee}');
					        }
					    }

					    // Initial call to set the delivery fee based on the default selected order type
					    updateDeliveryFee();

					    // Handle radio button change event
					    $("input[name='orderType']").change(function() {
					        updateDeliveryFee(); // Update delivery fee when the order type changes
					    });
						

					});
</script>

<script>
	$("#check_module").click(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('가맹점식별코드');
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg : 'kakao',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name : '주문명 : 아메리카노',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount : 2000,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name : '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode : '123-456',
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
	
	
	function a(){								
	
			var deliveryAddress = $("#section-order-address-citygu").val();  
			var detailedAddress = $("#base-structure-input").val(); 
			let allAddress = deliveryAddress+ " " + detailedAddress;
			
		
		  /// hidden  값넣어 주기
		  $("#allAddress").val( allAddress);
		  $("#order-form").submit();	
   }

	$(document)
			.ready(
					function() {

						// Handle radio button change event for payment method
						$("input[name='payType']")
								.change(
										function() {
											var selectedPayType = $(
													"input[name='payType']:checked")
													.attr("id");
											var formAction = selectedPayType === 'card' ? 'kakaoPay'
													: 'orderDetail';
											

											// Update the form action
											$("#order-form").attr("action",
													formAction);
										});

						// Function to update the hidden deliveryAddress field
						
						
						
						
						function updateDeliveryAddress() {
							var deliveryAddress = $("#section-order-address-citygu").val(); // Get the user's address
							var detailedAddress = $("#base-structure-input").val(); // Get the detailed address
							deliveryAddress += detailedAddress;

							// Concatenate user's address and detailed address
							/* if (detailedAddress.trim() !== "") {
								deliveryAddress += " " + detailedAddress;
							}
 */
							// Update the hidden deliveryAddress field value
							$(".section-order-address-citygu").val(deliveryAddress);
 
 							return deliveryAddress;
						}

						// Initial call to set the delivery address based on the default value
						updateDeliveryAddress();
						
						

						// Handle detailed address input change event
						$("#base-structure-input").on("input", function() {
							updateDeliveryAddress(); // Update delivery address when the detailed address changes
						});

						function updateRequestValues() {
							var reqToSellerStoreValue = $(
									"input[name='reqToSeller']").val();
							var reqToRiderValue = $("input[name='reqToRider']")
									.val();

							// Set values in hidden fields
							$("#reqToSeller").val(reqToSellerStoreValue);
							$("#reqToRider").val(reqToRiderValue);
						}

						// Initial call to set the request values based on default values
						updateRequestValues();

						// Handle input change event
						$("input[name='reqToSeller'], input[name='reqToRider']")
								.on("input", function() {
									updateRequestValues(); // Update request values when input changes
								});

						// Additional logic to hide/show the rider's request section based on orderType
						function toggleRiderRequestVisibility() {
							var selectedOrderType = $(
									"input[name='orderType']:checked").val();

							// Check if the selected order type is 'pickup'
							if (selectedOrderType === '1') {
								// If 'pickup', hide the rider's request section
								$('#rider-request-section').hide();
							} else {
								// If not 'pickup', show the rider's request section
								$('#rider-request-section').show();
							}
						}

						// Initial call to set visibility based on the default selected order type
						toggleRiderRequestVisibility();

						// Handle radio button change event
						$("input[name='orderType']").change(function() {
							toggleRiderRequestVisibility(); // Toggle visibility when the order type changes
						});

					});

	
</script>



<body>





	<jsp:include page="../base/header.jsp" />

	<section id="content">
		<div class="wrap-all">
		<div class="section-order-title">
			<div class="section-order-title-inner">
				<h1>주문하기</h1>
			</div>
		</div>
		<hr class="line">
		<form id="order-form" method="post" action="orderDetail">
			<div class="section-order-select">
				<div class="section-select-ordertype">
					<input id="select-ordertype-delivery" type="radio" name="orderType"
						value=0 checked="checked"> 배달
				</div>
				<div class="section-select-ordertype">
					<input id="select-ordertype-pickup" type="radio" name="orderType"
						value=1> 포장
				</div>
			</div>
			<div class="section-order-address-wrap" id="address-wrap">
				<div class="section-order-address">
					<div class="section-order-address-api" id="base-structure">
						<img class="current-location-img"
							src="resources/icons/current-location.png"> 기타
					</div>
					
					<div class="section-order-address-citygu">현재주소 :
						${addressDTO.deliveryAddress }</div>
						<input type="hidden" value="${addressDTO.deliveryAddress }" id="section-order-address-citygu">
					<input class="section-order-address-detail" placeholder="상세주소"
						name="detailDeliveryAddress" id="base-structure-input" value="${addressDTO.detailDeliveryAddress}">
				</div>
			</div>
			<div class="section-order-phone-wrap">
				<div class="section-order-phone" id="base-structure">${userInfo[0].userPhone}</div>
			</div>

			<div class="section-order-request-wrap">
				<div class="section-order-request-seller">
					<div class="section-order-request-title" id="base-structure">요청사항</div>
					<div class="section-order-request-seller">가게 사장님께</div>
					<input class="input-tag" type="text" name="reqToSeller" placeholder="예)덜 맵게 해주세요">
					<div id="rider-request-section">
						<div class="section-order-request-rider">라이더님께</div>
						<input class="input-tag" type="text" name="reqToRider"
							placeholder="예)문 앞에 두고 벨 눌러주세요">
					</div>
				</div>
			</div>
			<div class="section-order-paytype-wrap">
				<div class="section-order-paytype-title" id="base-structure">결제수단</div>
				
				<div class="section-order-paytype-cash">
					<input type="radio" id="cash" name="payType" value="1" checked="checked">
					<div id="base-structure">현장결제</div>
				</div>
				
				<div class="section-order-paytype-card">
					<div class="section-order-paytype-card-wrap">
						<input type="radio" id="card" name="payType" value="0">
						<div id="base-structure">카카오페이 결제</div>
					</div>
				</div>
			</div>
			<div class="section-order-price-wrap">
				<div class="section-order-price-title" id="base-structure">결제금액</div>
				<div class="section-order-price-detail-wrap">
					<div class="section-order-price-detail">주문금액</div>
					<div class="section-order-price-detail-amount">${orderMenuPrice}원</div>
				</div>
				<div class="section-order-price-detail-wrap-delivery">
					<div class="section-order-price-detail-delivery">배달팁</div>
					<div class="section-order-price-detail-amount-delivery">${storeInfo[0].deliveryFee}원</div>
				</div>
			</div>
			<c:set var="totalAmount"
				value="${orderMenuPrice + storeInfo[0].deliveryFee}" />

			<div class="section-order-orderMenuPrice-wrap">
				<div class="secion-order-totalPrice-title">총 결제금액</div>
				<div class="section-order-orderMenuPrice">${totalAmount}원</div>
			</div>
			<div class="section-order-button-wrap">
				<input type="hidden" name="allAddress" id="allAddress" > 
				<input type="hidden" name="deliveryAddress" id="deliveryAddress" value="${addressDTO.deliveryAddress}"> 
					<input type="hidden"
					name="deliveryFee" id="deliveryFee"	value="${storeInfo[0].deliveryFee}"> <input type="hidden"
					name="userPhone" id="userPhone" value="${userInfo[0].userPhone}">
					
					<input
					type="hidden" name="orderMenuPrice" id="orderMenuPrice"
					value="${orderMenuPrice}">
				<button type="button" onclick="a()" id="order-button">결제하기</button>
			</div>
		</form>
	</div>
	</section>


	<jsp:include page="../base/footer.jsp" />

</body>
</html>