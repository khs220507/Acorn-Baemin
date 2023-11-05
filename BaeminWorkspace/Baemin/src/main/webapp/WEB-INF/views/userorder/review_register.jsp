<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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

.review-title {
	width: 1280px;
	border-bottom: 1px solid black;
	margin: 0 auto;
	margin-left: 100px;
	margin-right: 100px;
}

.order-date-state {
	margin-left: 100px;
	margin-right: 100px;
	display: flex;
}

.order-date {
	margin-right: 10px;
}

.order-info-wrap {
	display: flex;
	margin-left: 100px;
	margin-right: 100px;
}

.order-info-image {
width: 100px;
}

.order-detail-wrap{
margin : auto 0 ;
margin-left:10px;
margin-right: 10px;
}


</style>
<body>



	<jsp:include page="../base/header.jsp" />

	<section>

		<div class="review-title">
			<div class="review-title-inner">
				<h1>리뷰쓰기</h1>
			</div>
		</div>

		<div class="order-date-state">
			<div class="order-date">10.19(목)</div>
			<div class="order-state">픽업완료</div>
		</div>

		<div class="order-info-wrap">
			<div class="order-info-image">
				<img class="order-info-image" src="resources/images/food.png">
			</div>
			<div class="order-detail-wrap">
				<div class="order-store-name">BBQ 홍대점</div>
				<div class="order-info-detail">황올 반+양념 반 외 2개 35,900원</div>
			</div>
		</div>
	</section>
	<jsp:include page="../base/footer.jsp" />

</body>
</html>