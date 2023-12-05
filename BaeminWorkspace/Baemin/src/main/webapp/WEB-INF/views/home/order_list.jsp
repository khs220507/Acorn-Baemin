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

hr {
	background-color: #d9d9d9;
	height: 3px;
	border: 0px;
}
/* 섹션  ////////////////////////////////////////////////////*/
.wrap-all {
	width: 75%;
	margin: 0 auto;
}

.orderList-title {
	margin-bottom: 10px;
}

.orderList-wrap {
	position: relative;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 30px;
	padding-right: 30px;
}

.delete-icon {
	width: 20px;
	height: 20px;
	position: absolute;
	right: 60px;
	cursor: pointer;
}

.date-wrap {
	display: flex;
}

.date-wrap p {
	font-size: 14px;
}

.dot {
	margin-left: 5px;
	margin-right: 5px;
}

.order-num {
	display: none;
}
/**/
.wrap-center {
	display: flex;
	align-items: center;
	margin: 10px;
}

.store-img {
	width: 100px;
	height: 100px;
	flex: 1;
}

.store-menu-wrap {
	flex: 8;
	margin-left: 20px;
}

.store-name {
	cursor: pointer;
	font-size: 17px;
	color: black;
}

.menu-info {
	display: flex;
	margin-top: 5px;
}

.menu-info p {
	font-size: 15px;
}

.menu-text {
	margin-right: 10px;
}

.btn-wrap {
	flex: 1;
}

.gray-radius-btn {
	width: 100px;
	background-color: white;
	border: 1px solid #d9d9d9;
	border-radius: 30px;
	padding: 5px;
	margin: 5px;
	font-size: 15px;
}

.add-menu-btn {
	width: 100%;
	height: 50px;
	background-color: white;
	color: #48D1CC;
	border: 2px solid #48D1CC;
	border-radius: 5px;
	margin-bottom: 20px;
	font-size: 17px;
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
	.wrap-center {
		flex-direction: column;
	}
	.store-menu-wrap {
		margin-left: 0;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
}
</style>
</head>
<body>

	<jsp:include page="../base/header.jsp" />

	<section id="content">

		<div class="wrap-all">
			<h3 class="orderList-title">주문내역</h3>
			<hr>

			<!-- 주문내역 -->
			<c:forEach items="${orderList }" var="orderList">

				<div class="orderList-wrap">

					<img class="delete-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg==">
					<div class="date-wrap">
						<p>${orderList.orderDate }</p>
						<p class="dot">·</p>
						<p>${orderList.orderStatus}</p>
						<span class="order-num">${orderList.orderNumber }</span>
					</div>


					<div class="wrap-center">
						<a href="${path}/store?storeCode=${orderList.storeCode}"> <img
							class="store-img"
							src="${path}/storeImages/${orderList.orderStoreImage }"></a>
						<div class="store-menu-wrap">
							<a href="${path}/store?storeCode=${orderList.storeCode}">
								<p class="store-name">${orderList.orderStoreName}</p>
							</a>
							<div class="menu-info">
								<p class="menu-text">${orderList.orderMenuName}</p>
								<p class="menu-text">${orderList.orderMenuNumber}개</p>
								<p>${orderList.orderMenuPrice + orderList.deliveryFee}원</p>
							</div>
						</div>
						<div class="btn-wrap">
							<button class="gray-radius-btn" id="order-detail-btn">주문상세</button>
							<br>
							<input type="hidden" id="reviewStatus" value="${orderList.reviewStatus}">
							<button class="gray-radius-btn" id="review-write-btn">리뷰쓰기</button>
						</div>
					</div>
					<button class="add-menu-btn" id="add-same-cart-btn">같은 메뉴 담기</button>
					<hr>
				</div>

			</c:forEach>

		</div>
	</section>

	<jsp:include page="../base/footer.jsp" />

	<script>
		// 주문내역 삭제		
		$(document).on('click', '.delete-icon', function() {
		    let deleteConfirmation = confirm("주문 내역을 삭제하시겠습니까?");
		    
		    if (deleteConfirmation) {
		        $(this).closest('.orderList-wrap').remove();
		        let orderNumber = $(this).closest('.orderList-wrap').find('.order-num').text().trim();
		        
		        deleteList(orderNumber);
		    }
		});

		function deleteList(orderNumber) {
		    // AJAX 요청
		    $.ajax({
		        type: "get",
		        url: "${path}/orderListDelete",
		        data: "orderNumber=" + orderNumber,
		        dataType: "text",
		        success: function(data) {
		            alert("주문 내역이 삭제되었습니다");
		            window.location.reload();
		        },
		        error: function(err) {
		            alert("삭제 요청에 실패했습니다.");
		            alert(orderNumber);
		        }
		    });
		}


		// 주문상세 버튼 클릭
		$(document).on(
				'click',
				'#order-detail-btn',
				function() {
					let orderNumber = $(this).closest('.orderList-wrap').find(
							'.order-num').text().trim();

					// 주문 상세 페이지로 이동
					window.location.href = "${path}/orderDetail?orderNumber="
							+ orderNumber;
				});
		
		// 리뷰쓰기 버튼 클릭
	    $(document).on('click', '#review-write-btn', function() {
	        let orderNumber = $(this).closest('.orderList-wrap').find('.order-num').text().trim();
	     
	        // Navigate to the review page with the corresponding orderNumber
	        window.location.href = "${path}/writeReview?orderNumber=" + orderNumber;
	    });
		
	    $(document).on('click', '#add-same-cart-btn', function() {
	        let orderNumber = $(this).closest('.orderList-wrap').find('.order-num').text().trim();

	        // Navigate to the review page with the corresponding orderNumber
	        window.location.href = "${path}/cartListRe?orderNumber=" + orderNumber;
	    });

	    
	    $(document).ready(function() {
	        // Iterate through each order list entry
	        $('.orderList-wrap').each(function() {
	            // Get the review status value from the hidden input
	            var reviewStatus = $(this).find('#reviewStatus').val();

	            // Check if the reviewStatus is 1
	            if (reviewStatus == 1) {
	                // Change the button text to "작성완료"
	                $(this).find('#review-write-btn').text('작성완료');

	                // Disable the button
	                $(this).find('#review-write-btn').prop('disabled', true);
	                
	                $(this).find(".delete-icon").css('display', 'none');
	            }
	        });
	    });
		
	</script>

</body>
</html>