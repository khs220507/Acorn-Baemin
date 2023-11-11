<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login Result</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

header {
	background-color: #48D1CC;
	height: 100px;
	margin-bottom: 50px;
}

button {
	outline: none;
	cursor: pointer;
}

/* 해더 */
.headerwrap {
	width: 1280px;
	border: 1px solid black;
	height: 100px;
	margin: 0 auto;
}

/* CSS 스타일 정의 */
.signup-select-form-title {
	text-align: center;
	padding: 20px;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.signup-select-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	/* 폼의 최대 너비 설정 */
	width: 100%;
	border: 3px solid #48D1CC;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
}

input[type="submit"] {
	font-weight: bolder;
	font-size: 18px;
	background-color: #48D1CC;
	color: white;
	height: 50px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 250px;
	display: block;
	margin: 0 auto;
	margin-bottom: 50px;
}

input[type="button"] {
	font-weight: bolder;
	font-size: 18px;
	background-color: #48D1CC;
	color: white;
	height: 50px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 250px;
	display: block;
	margin: 0 auto;
	margin-bottom: 50px;
}
</style>

<script>
	function a() {
		window.location.href = '/baemin/customer_signup';
	}
</script>
</head>

<body>
	<jsp:include page="../base/header.jsp"/>
	<section>
		<div class="container">
			<!-- 회원가입 유형 선택 폼 -->
			<form class="signup-select-form" method="post">
				<div class="signup-select-form-title">
					<h1>회원가입</h1>
				</div>

				<input type="button" name="signupType" value="소비자 회원가입"
					onclick="location.href='${path}/customer_signup'">
				<input type="button" name="signupType" value="사장님 회원가입"
					onclick="location.href='${path}/seller_signup'">

			</form>
			<p>
				<a href="${path}/home">홈으로 돌아가기</a>
			</p>
		</div>
	</section>
	<jsp:include page="../base/footer.jsp"/>
</body>

</html>