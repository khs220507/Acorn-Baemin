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
.cart-title {
	border-bottom: 1px #d9d9d9 solid;
}

.cart-store-wrap {
	display: flex;
}

.store-img {
	width: 100px;
	height: 100px;
}

.menu-title-wrap {
	display: flex;
}

.xbutton {
	width: 25px;
}

.menu-img {
	width: 200px;
}

.menu-detail-wrap {
	display: flex;
}

.quantity-wrap {
	text-align: right;
}

.minus {
	width: 25px;
	height: 25px;
}

.plus {
	width: 25px;
	height: 25px;
}

.quantity-input {
	width: 25px;
	height: 25px;
	text-align: center;
}

.total-price-wrap {
	display: flex;
	border-bottom: 1px solid #d9d9d9;
	border-top: 1px solid #d9d9d9;
	justify-content: space-between;
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
        $(".menu-option p").each(function() {
            var optionValues = $(this).text().split(":");
            var optionPrice = parseInt(optionValues[2].trim());
            totalOptionsPrice += optionPrice;
        });
        
   

        var totalPrice = (unitPrice + totalOptionsPrice) * quantity;
    

        $("#totalPriceInput").val(totalPrice);
        $("#total-price").text(totalPrice + "원");
    }

    updateTotalPrice();
});
</script>








</head>



<body>
	<jsp:include page="../base/header.jsp" />
	<section id="content">
		<div class="cart-title">장바구니</div>

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
				<c:forEach var="cartItem" items="${cartInfo.options}">
					<c:set var="splitValues" value="${fn:split(cartItem, '/')}" />
					<p>${splitValues[3]}:${splitValues[1]}:${splitValues[2]}:</p>
				</c:forEach>
			</div>
		</div>

		<div class="quantity-wrap">
			<button class="minus" type="button">-</button>
			<input class="quantity-input" value="1">
			<button class="plus" type="button">+</button>
		</div>


		<form id="orderForm" action="order" method="post">
			<input type="hidden" id="totalPriceInput" name="totalPrice" value="0">
			<div class="total-price-wrap">
				<div class="total-price-title">총 주문금액</div>
				<div class="total-price" id="total-price"></div>
			</div>
			<button type="submit">주문하기</button>
		</form>


	</section>


	<jsp:include page="../base/footer.jsp" />

</body>
</html>