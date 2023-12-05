<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
/* reset css */
a {
	text-decoration: none;
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

* {
	margin: 0;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

.thin-line {
	background-color: #d9d9d9;
	height: 3px;
	border: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.bold-line {
	height: 20px;
	background-color: #EBEBEB;
	border-top: 2px solid #d9d9d9;
	border-left: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
}

ul {
	list-style: none;
}

/* 섹션 //////////////////////////////////////////////////// */
.wrap-all {
	width: 75%;
	margin: 0 auto;
}

/* 배달이 완료되었어요 div*/
.store-menu-wrap {
	padding: 3px 30px;
}

.finish-message {
	color: #48D1CC;
	font-size: 20px;
}

.strong-title {
	font-size: 23px;
	margin: 5px 0;
	color: black;
}

.normal-text {
	font-size: 20px;
	margin: 5px 0;
}

.small-text {
	font-size: 14px;
	line-height: 20px;
}

.menu-detail-wrap {
	padding: 3px 30px;
}

.menu-detail-wrap ul {
	margin: 7px 0;
}

.menu-detail-wrap ul li {
	line-height: 22px;
	color: #4B4B4B;
}

.payment-wrap {
	padding: 3px 30px;
}

.left-right-wrap {
	display: flex;
}

.left-text {
	flex: 1;
}

.rigth-text {
	flex: 1;
	display: flex;
	justify-content: flex-end;
}

.total-payment-wrap {
	padding: 3px 30px;
}

.payment-type-wrap {
	padding: 3px 30px;
}

.black-text {
	color: black;
	margin-bottom: 7px;
}

.gray-text {
	font-size: 20px;
	color: #4b4b4b;
	margin: 5px 0;
}

.user-info-wrap {
	padding: 3px 30px;
}

.delete-btn-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
}

.delete-btn {
	cursor: pointer;
	color: red;
	margin-bottom: 10px;
}

.customer-center-wrap {
	padding: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #EBEBEB;
	border-top: 2px solid #d9d9d9;
}

.customer-center-wrap p {
	font-size: 20px;
	margin-right: 20px;
}

.add-cart-btn {
	color: white;
	background-color: #48D1CC;
	width: 100%;
	height: 80px;
	border-radius: 10px;
	border: none;
	margin-top: 30px;
	font-size: 23px;
}
#orderNumber{
	display: none;
}

/* 반응형 /////////////////////////////////////////////////////////////////*/

/* 중간화면 */
@media ( max-width :1280px) {
	section {
		width: 100vw;
	}
	.wrap-all {
		width: 75vw;
	}
}

/* 작은화면 */
@media ( max-width :767px) {
	section {
		width: 100vw;
	}
	.wrap-all {
		width: 90vw;
	}
}
</style>
</head>
<body>

	<jsp:include page="../base/header.jsp" />

	<section id="content">
	

		<div class="wrap-all">

			<c:forEach items="${orderDetail}" var="detail">

				<c:choose>
					<c:when test="${detail.orderType == 0}">
						<h3 class="detailList-title">주문내역</h3>
						<hr class="thin-line">

						<!--주문이 완료되었어요 div-->
						<div class="store-menu-wrap">
							<p class="finish-message">주문이 완료되었어요</p>
							<a href="${path}/store?storeCode=${detail.storeCode}">
								<p class="strong-title">${detail.orderStoreName}</p>
							</a>
							<p class="normal-text">${detail.orderMenuName }</p>
							<p class="small-text">주문일시: ${detail.orderDate }</p>
							<span id="orderNumber">${detail.orderNumber}</span>
							<p class="small-text">주문번호: ${detail.orderNumber }</p>
						</div>
						<hr class="bold-line">

						<!--메뉴 div-->
						<div class="menu-detail-wrap">
							<p class="strong-title">${detail.orderMenuName }
								${detail.orderMenuNumber }개</p>

								<c:choose>
									<c:when test="${detail.optionsInfo == '' or detail.optionsInfo == null}">
										<input type="hidden">
									</c:when>
									<c:otherwise>
										<!-- 옵션 -->
										<c:set var="optionsInfo" value="${detail.optionsInfo }" />
										<c:set var="options" value="${fn:split(optionsInfo, ',')}" />

										<ul>
											<c:forEach items="${options}" var="option">
												<c:set var="parts" value="${fn:split(option, '/')}" />
												<li>· ${parts[3]}: ${parts[1]} (${parts[2]}원)</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
								
							<p class="normal-text">${detail.orderMenuPrice}원</p>
						</div>
						<hr class="bold-line">

						<!--결제 금액 div-->
						<div class="payment-wrap">
							<p class="strong-title">결제 금액</p>
							<div class="left-right-wrap">
								<p class="normal-text left-text">주문금액</p>
								<p class="normal-text rigth-text">${detail.orderMenuPrice}원</p>
							</div>
							<div class="left-right-wrap">
								<p class="normal-text left-text">배달팁</p>
								<p class="normal-text rigth-text">${detail.deliveryFee }원</p>
							</div>
						</div>

						<hr class="thin-line">

						<div class="total-payment-wrap left-right-wrap">
							<p class="strong-title left-text">총 결제금액</p>
							<p class="normal-text rigth-text">${detail.orderMenuPrice + detail.deliveryFee}원</p>
						</div>

						<hr class="bold-line">

						<div class="payment-type-wrap left-right-wrap">
							<p class="strong-title left-text">결제방법</p>
							<c:choose>
								<c:when test="${detail.payType eq 0}">
									<p class="normal-text right-text">카카오페이</p>
								</c:when>
								<c:when test="${detail.payType eq 1}">
									<p class="normal-text right-text">현장결제</p>
								</c:when>
								<c:otherwise>
									<p class="normal-text right-text">알 수 없는 결제방법</p>
								</c:otherwise>
							</c:choose>
						</div>

						<hr class="bold-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">배달 주소</p>
							<p class="gray-text">${detail.deliveryAddress}, ***</p>
						</div>

						<hr class="thin-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">전화번호</p>
							<p class="gray-text">${detail.userPhone}</p>
						</div>

						<hr class="thin-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">가게 사장님께</p>
							<p class="gray-text">${detail.reqToSeller }</p>
						</div>

						<hr class="thin-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">라이더님께</p>
							<p class="gray-text">${detail.reqToRider }</p>
						</div>

						<hr class="bold-line">

						<div class="delete-btn-wrap">
							<h2 class="delete-btn"
								onclick="deleteOrder(${detail.orderNumber})">주문 내역 삭제</h2>
						</div>

						<div class="customer-center-wrap">
							<p>24시간 연중무휴 고객센터</p>
							<h2>1600-0987</h2>
						</div>

						<button class="add-cart-btn" id="add-same-cart-btn">같은 메뉴 담기</button>
					</c:when>

					<c:when test="${detail.orderType == 1}">

						<h3 class="detailList-title">주문내역</h3>
						<hr class="thin-line">

						<!--주문이 완료되었어요 div-->
						<div class="store-menu-wrap">
							<p class="finish-message">주문이 완료되었어요</p>
							<a href="${path}/store?storeCode=${detail.storeCode}">
								<p class="strong-title">${detail.orderStoreName}</p>
							</a>
							<p class="normal-text">${detail.orderMenuName }</p>
							<p class="small-text">주문일시: ${detail.orderDate }</p>
							<p class="small-text">주문번호: ${detail.orderNumber }</p>
						</div>
						<hr class="bold-line">

						<!--메뉴 div-->
						<div class="menu-detail-wrap">
							<p class="strong-title">${detail.orderMenuName }
								${detail.orderMenuNumber }개</p>

							<!-- 옵션 -->
						
								<c:choose>
									<c:when test="${detail.optionsInfo == '' or detail.optionsInfo == null}">
										<input type="hidden">
									</c:when>
									<c:otherwise>
										<!-- 옵션 -->
										<c:set var="optionsInfo" value="${detail.optionsInfo }" />
										<c:set var="options" value="${fn:split(optionsInfo, ',')}" />

										<ul>
											<c:forEach items="${options}" var="option">
												<c:set var="parts" value="${fn:split(option, '/')}" />
												<li>· ${parts[3]}: ${parts[1]} (${parts[2]}원)</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>

							<p class="normal-text">${detail.orderMenuPrice}원</p>
						</div>
						<hr class="bold-line">

						<!--결제 금액 div-->
						<div class="payment-wrap">
							<p class="strong-title">결제 금액</p>
							<div class="left-right-wrap">
								<p class="normal-text left-text">주문금액</p>
								<p class="normal-text rigth-text">${detail.orderMenuPrice}원</p>
							</div>
						</div>

						<hr class="thin-line">

						<div class="total-payment-wrap left-right-wrap">
							<p class="strong-title left-text">총 결제금액</p>
							<p class="normal-text rigth-text">${detail.orderMenuPrice}원</p>
						</div>

						<hr class="bold-line">

						<div class="payment-type-wrap left-right-wrap">
							<p class="strong-title left-text">결제방법</p>
							<c:choose>
								<c:when test="${detail.payType eq 0}">
									<p class="normal-text right-text">카카오페이</p>
								</c:when>
								<c:when test="${detail.payType eq 1}">
									<p class="normal-text right-text">현장결제</p>
								</c:when>
								<c:otherwise>
									<p class="normal-text right-text">알 수 없는 결제방법</p>
								</c:otherwise>
							</c:choose>
						</div>

						<hr class="bold-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">전화번호</p>
							<p class="gray-text">${detail.userPhone}</p>
						</div>

						<hr class="thin-line">

						<div class="user-info-wrap">
							<p class="normal-text black-text">가게 사장님께</p>
							<p class="gray-text">${detail.reqToSeller }</p>
						</div>

						<hr class="bold-line">

						<div class="delete-btn-wrap">
							<h2 class="delete-btn"
								onclick="deleteOrder(${detail.orderNumber})">주문 내역 삭제</h2>
						</div>

						<div class="customer-center-wrap">
							<p>24시간 연중무휴 고객센터</p>
							<h2>1600-0987</h2>
						</div>

						<button class="add-cart-btn" id="add-same-cart-btn">같은 메뉴 담기</button>

					</c:when>
				</c:choose>


			</c:forEach>
		</div>

	</section>

	<jsp:include page="../base/footer.jsp" />

	<!-- 자바스크립트 -->
	<script>
		// 주문내역 삭제 함수
		function deleteOrder(orderNumber) {
			if (confirm("주문 내역을 삭제하시겠습니까?")) {
				$.ajax({
					type : "GET",
					url : "${path}/orderListDelete",
					data : "orderNumber=" + orderNumber,
					success : function() {
						alert("주문 내역이 삭제되었습니다");
						window.location.href = "${path}/orderList";
					},
					error : function() {
						alert("삭제에 실패했습니다.");
					}
				});
			}
		}
		
		
		$(document).on('click', '#add-same-cart-btn', function() {
			let orderNumber = $(this).closest('.wrap-all').find('#orderNumber').text().trim();
	        window.location.href = "${path}/cartListRe?orderNumber=" + orderNumber;
	    });
		
		
		
	</script>

</body>
</html>