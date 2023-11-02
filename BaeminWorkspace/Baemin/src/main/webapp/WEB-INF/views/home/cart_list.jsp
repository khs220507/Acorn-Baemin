<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* 태그 파트 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

section {
	flex: 7.8;
}

}
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

button {
	outline: none;
	cursor: pointer;
	/* 손가락모양 */
}

/* 해더 */
.headerwrap {
	width: 1280px;
	border: 1px solid black;
	height: 100px;
	margin: 0 auto;
}

/* 세션 */
/* 풋터 */
ul, li {
	margin: 10px;
}

.section-cart-title {
	width: 1280px;
	border-bottom: 1px solid black;
	margin: 0 auto;
}

.section-cart-title-inner {
	margin-left: 100px;
}

.section-cart-box {
	width: 1200px;
	height: 800px;
}

.section-cart-box {
	overflow-y: auto; /*섹션의 내용이 넘치는 경우 스크롤이 가능*/
	-ms-overflow-style: none; /* 스크롤바 없애기 */
}

.section-cart-box::-webkit-scrollbar { /* 스크롤바 없애기 */
	display: none;
}

.section-cart-inner {
	width: 700px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.section-cart-storeinfo-img {
	width: 100px;
}

.section-cart-store-img {
	width: 64px;
	border: 1px solid black;
}

.section-cart-menuname-wrap {
	display: flex;
}

.section-cart-menuname {
	display: flex;
	justify-content: space-between;
}

#cart-delete {
	border: 1px solid black;
	background-color: #d9d9d9;
	cursor: pointer;
}

.section-cart-menuinfo-wrap {
	display: flex;
	border-bottom: 1px solid #d9d9d9;
}

.section-cart-menuinfo-img {
	width: 100px;
}

.section-cart-change-number-wrap {
	position: relative;
}

.section-cart-change-number-inner {
	position: absolute;
	right: 0px;
}

.section-cart-orderprice {
	text-align: right;
}

.section-cart-change-number-input {
	display: flex;
	justify-content: right;
	align-items: center;
}

.section-cart-order-wrap {
	border-bottom: 1px solid black;
}

.section-cart-totalprice-wrap {
	display: flex;
	justify-content: space-between;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.section-cart-order-button {
	display: flex;
	justify-content: center;
}
</style>

<script>

function cartDelete(cartCode) {
    $.ajax({
		type: "DELETE",
		url: "/baemin/cartList/" + cartCode,
		
		success : function (data){
			window.location.reload();
			 $("#cart-item-" + cartCode).remove();
			
		},
		error: function() {
			alert( "error");
		}
	});
}


</script>

</head>


<body>
	<jsp:include page="../base/header.jsp" />

	<c:set var="storeList" value="${cartMap.storeList}" />
	<c:set var="cartList" value="${cartMap.cartList}" />
	<c:set var="menuList" value="${cartMap.menuList}" />
	<c:set var="optionList" value="${cartMap.optionList}" />




	<section>


		<div class="section-cart-title">
			<div class="section-cart-title-inner">
				<h1>장바구니</h1>
			</div>

		</div>



		<div class="section-cart-box">
			<c:forEach var="item" items="${cartMap.cartList}" varStatus="cnt">

				<c:set var="storeName" value="${storeList[cnt.count-1].storeName}"></c:set>
				<c:set var="storeImage" value="${storeList[cnt.count-1].storeImage}"></c:set>
				<c:set var="menuName" value="${menuList[cnt.count-1].menuName}"></c:set>
				<c:set var="menuImage" value="${menuList[cnt.count-1].menuImage}"></c:set>

				<div class="section-cart-inner" id="cart-item-${item.cartCode}">

					<div class="section-cart-storeinfo">

						<img class="section-cart-store-img"
							src="${pageContext.request.contextPath}/resources/images/${storeImage}.jpg"
							alt="Image Description"> <span>${storeName}</span>

					</div>

					<div>

						<div class="section-cart-menuname">
							<span>${menuName}</span> <img src="">
							<div id="cart-delete" onclick="cartDelete(${item.cartCode})">삭제${item.cartCode}</div>
						</div>

						<div class="section-cart-menuinfo-wrap">
							<div>
								<img class="section-cart-menuinfo-img"
									src="${pageContext.request.contextPath}/resources/images/${menuImage}.png"
									alt="Image Description">
							</div>
							<div>
								<ul>
									<li>옵션01 : 24000원</li>
									<li>옵션02 : 2000원</li>
								</ul>
							</div>
						</div>


						<div class="section-cart-change-number-wrap">
							<div class="section-cart-change-number-input">
								<span> - </span> <input type="text" placeholder=" 1 "
									style="width: 20px;"> <span> + </span>
							</div>
			</c:forEach>



			<div class="section-cart-orderprice">
				<span>주문금액:26000</span>
			</div>
		</div>




		<div class="section-cart-order-wrap">
			<div class="section-cart-totalprice-wrap">
				<div class="section-cart-totalprice-title">총 주문금액</div>
				<div class="section-cart-totalprice">26000원</div>
			</div>
			<div class="section-cart-order-button">
				<button>주문하기</button>
			</div>
		</div>
		</div>
		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />

</body>
</html>