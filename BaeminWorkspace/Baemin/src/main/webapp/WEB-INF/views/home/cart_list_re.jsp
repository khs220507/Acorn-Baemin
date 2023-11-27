<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="<%=request.getContextPath()%>"></c:set>




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.wrap-all{
	width: 75%;
	height: 650px;
	margin: 30px auto;
	position: relative;
}
.cart-title {
	border-bottom: 3px #d9d9d9 solid;
	font-size: 22px;
	padding: 5px;
}
.cart-inside-wrap{
	padding: 20px 30px;
}

.cart-store-wrap {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.store-img {
	width: 50px;
	height: 50px;
	margin-right: 13px;
}

.menu-title-wrap {
	display: flex;
	font-size: 20px;
}

.xbutton {
	width: 25px;
}

.menu-img {
	width: 80px;
	height: 80px;
	margin-right: 10px;
}
.menu-option p{
	font-size: 16px;
}

.menu-detail-wrap {
	display: flex;
	align-items: center;
	margin-top: 8px;
}

.quantity-wrap {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.minus {
	width: 25px;
	height: 25px;
	border: none;
	background-color: white;
	font-size: 25px;
}

.plus {
	width: 25px;
	height: 25px;
	border: none;
	background-color: white;
	font-size: 25px;
}

.quantity-input {
	width: 25px;
	height: 25px;
	text-align: center;
	margin: 0 3px;
	padding-bottom: 3px;
}
.thin-line{
	background-color: #d9d9d9;
	height: 2px;
	border: 0px;
}
.total-price-wrap {
	display: flex;
	border-bottom: 3px solid #d9d9d9;
	border-top: 3px solid #d9d9d9;
	justify-content: space-between;
	padding: 15px;
	font-size: 22px;

	position: absolute;
	bottom: 60px;
	left: 0;
	right: 0;
}
.order-btn{
	width: 250px;
	height: 40px;
	font-size: 20px;
	border: none;
	border-radius: 10px;
	background-color: #48D1CC;
	color: white;

	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	margin: 0 auto;
	
}
.order-refuse-btn {
	width: 250px;
	height: 40px;
	font-size: 20px;
	border: none;
	border-radius: 10px;
	background-color: #d9d9d9;
	color: #4b4b4b;
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>



<script>
$(document).ready(function() {
    // Use JSTL to set unitPrice as a JavaScript variable
    var unitPrice = ${menuInfo[0].menuPrice};


    function adjustQuantity(change) {
        var quantityInput = $(".quantity-input");
        var currentQuantity = parseInt(quantityInput.val());

        // Ensure the quantity is not negative
        if (currentQuantity + change >= 1) {
            quantityInput.val(currentQuantity + change);
            updateTotalPrice();
        }
    }

    $(".minus").click(function() {
        adjustQuantity(-1);
    });

    $(".plus").click(function() {
        adjustQuantity(1);
    });

    function updateTotalPrice() {
        var quantity = parseInt($(".quantity-input").val());

 
        var totalOptionsPrice = 0;
        $(".option-total-price").each(function() {
            var optionValues = $(this).text().split(":");
            var optionPrice = parseInt(optionValues[2].trim());
            totalOptionsPrice += optionPrice;
        });
        
   

        var orderMenuPrice = (unitPrice + totalOptionsPrice) * quantity;
    

        $("#totalPriceInput").val(orderMenuPrice);
        $("#total-price").text(orderMenuPrice + "원");
    }

    updateTotalPrice();
});
</script>








</head>



<body>
	<jsp:include page="../base/header.jsp" />
	<section id="content">
	<div class="wrap-all">
		<div class="cart-title">장바구니</div>

	<div class="cart-inside-wrap">
		<div class="cart-store-wrap">
			<img class="store-img"
				src="${path}/storeImages/${storeInfo[0].storeImage}">
			<div>${storeInfo[0].storeName}</div>
		</div>

		<div class="menu-title-wrap">
			<div class="menu-title">${menuInfo[0].menuName}</div>
		</div>

		<div class="menu-detail-wrap">
			<img class="menu-img"
				src="${path}/menuImages/${menuInfo[0].menuImage}">
			<div class="menu-option">
				<p>가격: ${menuInfo[0].menuPrice}원</p>
				<c:forEach var="cartItem" items="${cartInfo.options}">
					<c:set var="splitValues" value="${fn:split(cartItem, '/')}" />
					<p class="option-total-price">${splitValues[3]}:${splitValues[1]}:${splitValues[2]}원</p>
				</c:forEach>
			</div>
		</div>
		
		<form id="orderForm" action="order" method="post">

		<div class="quantity-wrap">
			<button class="minus" type="button">-</button>
			<input class="quantity-input" id="quantity" name="orderMenuNumber" value="1">
			<button class="plus" type="button">+</button>
		</div>
		
	</div>

	<hr class="thin-line">
		
			<input type="hidden" id="totalPriceInput" name="orderMenuPrice" value="0">
			<div class="total-price-wrap">
				<div class="total-price-title">총 주문금액</div>
				<div class="total-price" id="total-price"></div>
			</div>
			
			<c:choose>
			    <c:when test="${storeInfo[0].storeStatus == 0}">
			        <button type="submit" class="order-btn">주문하기</button>
			    </c:when>
			    <c:when test="${storeInfo[0].storeStatus == 1}">
			    	<div class="order-refuse-btn">영업 준비중입니다</div>
			    </c:when>
			</c:choose>
					
		</form>

	</div>
	</section>


	<jsp:include page="../base/footer.jsp" />

</body>
</html>