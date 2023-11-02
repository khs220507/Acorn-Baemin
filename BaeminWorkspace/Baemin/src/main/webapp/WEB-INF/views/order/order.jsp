<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.section-order-title {
	width: 1280px;
	border-bottom: 1px solid black;
	margin: 0 auto;
}

.section-order-title-inner {
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

.section-order-select{
display:flex;
}

.section-select-menu{
border: 1px solid black;
}

</style>
<body>


	<jsp:include page="../base/header.jsp" />

	<section>

		<div class="section-order-title">
			<div class="section-order-title-inner">
				<h1>주문하기</h1>
			</div>
		</div>
		
		<div class="section-order-select">
		<div class="section-select-menu"><input type="radio" name="select-menu", value="delivery">배달</div>
		<div class="section-select-menu"><input type="radio" name="select-menu", value="pickup">포장</div>
		</div>
		
		


	</section>


	<jsp:include page="../base/footer.jsp" />








</body>
</html>