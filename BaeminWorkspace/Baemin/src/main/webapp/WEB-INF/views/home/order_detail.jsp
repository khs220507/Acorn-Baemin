<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
section {
	width: 1280px;
	padding-top: 140px; /* 헤더 높이만큼 padding-top 추가 */
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정 */
}

/* 배달이 완료되었어요 div*/
.store-menu-wrap {
	padding-left: 30px;
	padding-right: 30px;
}

.finish-message {
	color: #48D1CC;
	font-size: 20px;
	margin-bottom: 4px;
}

.strong-title {
	font-size: 23px;
	margin-top: 3px;
	margin-bottom: 3px;
}

.normal-text {
	font-size: 20px;
	margin-bottom: 20px;
}

.menu-detail-wrap {
	padding-left: 30px;
	padding-right: 30px;
}

.payment-wrap {
	padding-left: 30px;
	padding-right: 30px;
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
	padding-left: 30px;
	padding-right: 30px;
}

.payment-type-wrap {
	padding-left: 30px;
	padding-right: 30px;
}

.gray-text {
	font-size: 20px;
	margin-bottom: 20px;
	color: #4b4b4b;
}

.user-info-wrap {
	padding-left: 30px;
	padding-right: 30px;
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
</style>
</head>
<body>

	<jsp:include page="../base/header.jsp" />

	<section id="content">


		<c:forEach items="${orderDetail}" var="detail">

			<h3 class="detailList-title">주문내역</h3>
			<hr class="thin-line">

			<!--배달이 완료되었어요 div-->
			<div class="store-menu-wrap">
				<p class="finish-message">
					<strong>배달이 완료되었어요</strong>
				</p>
				<a href="${path}/store?storeCode=${detail.storeCode}">
					<p class="strong-title">
						<strong>${detail.orderStoreName}</strong>
					</p>
				</a>
				<p class="normal-text">${detail.orderMenuName }</p>
				<p>주문일시: ${detail.orderDate }</p>
				<p>주문번호: ${detail.orderNumber }</p>
			</div>
			<hr class="bold-line">

			<!--메뉴 div-->
			<div class="menu-detail-wrap">
				<p class="strong-title">
					<strong>${detail.orderMenuName } ${detail.orderMenuNumber }개</strong>
				</p>
				<ul>
					<li>· 옵션 : 옵션내용</li>
					<li>· 황올 부분육 선택 : 순살 변경 (2000원)</li>
					<li>· 기본제공 품목제외 : 치킨무 미제공</li>
					<li>· 기타 선택 : 미선택</li>
				</ul>
				<p class="normal-text">${detail.orderMenuPrice}원</p>
			</div>
			<hr class="bold-line">

			<!--결제 금액 div-->
			<div class="payment-wrap">
				<p class="strong-title">
					<strong>결제 금액</strong>
				</p>
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
				<p class="strong-title left-text">
					<strong>총 결제금액</strong>
				</p>
				<p class="normal-text rigth-text">${detail.orderMenuPrice + detail.deliveryFee}원</p>
			</div>

			<hr class="bold-line">

			<div class="payment-type-wrap left-right-wrap">
				<p class="strong-title left-text">
					<strong>결제방법</strong>
				</p>
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
				<p class="normal-text">배달주소</p>
				<p class="gray-text">${detail.deliveryAddress }</p>
			</div>

			<hr class="thin-line">

			<div class="user-info-wrap">
				<p class="normal-text">전화번호</p>
				<p class="gray-text">${detail.userPhone}</p>
			</div>

			<hr class="thin-line">

			<div class="user-info-wrap">
				<p class="normal-text">가게 사장님께</p>
				<p class="gray-text">${detail.reqToSeller }</p>
			</div>

			<hr class="thin-line">

			<div class="user-info-wrap">
				<p class="normal-text">라이더님께</p>
				<p class="gray-text">${detail.reqToRider }</p>
			</div>

			<hr class="bold-line">

			<div class="delete-btn-wrap">
				<h2 class="delete-btn" onclick="deleteOrder(${detail.orderNumber})">주문
					내역 삭제</h2>
			</div>

			<div class="customer-center-wrap">
				<p>24시간 연중무휴 고객센터</p>
				<h2>1600-0987</h2>
			</div>

			<button class="add-cart-btn">
				<strong>같은 메뉴 담기</strong>
			</button>

		</c:forEach>

	</section>

	<jsp:include page="../base/footer.jsp" />

	<!-- 자바스크립트 -->
	<script>
	 // 주문내역 삭제 함수
    function deleteOrder(orderNumber) {
        if (confirm("주문 내역을 삭제하시겠습니까?")) {
            $.ajax({
                type: "GET",
                url: "${path}/orderListDelete",
                data: "orderNumber=" + orderNumber,
                success: function () {
                	alert("주문 내역이 삭제되었습니다");
                    window.location.href = "${path}/orderList"; 
                },
                error: function () {
                    alert("삭제에 실패했습니다.");
                }
            });
        }
    }
	</script>

</body>
</html>