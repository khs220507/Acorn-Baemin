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
/* CSS 스타일 정의 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}



section {
width: 1280px;
	padding-top: 140px;
	margin-bottom: 50px;
	
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column; align-items : center;
	height: 100vh;
	align-items: center;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.login-title {
	text-align: center;
	padding: 20px;
}

.login-title h1 {
	color: #333;
}

.container p {
	font-size: 18px;
	color: #555;
}
.signup-link p{
	font-size: 18px;
	color: #555;
}

.login-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	/* 폼의 최대 너비 설정 */
	width: 100%;
	border: 3px solid #48D1CC;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
}

.span1 {
	display: block;
	margin-bottom: 10px;
	font-weight: bolder;
}

/* input[type="text"], input[type="password"] { */
/* 	width: 99%; */
/* 	height: 30px; */
/* 	padding: 10px; */
/* 	font-size: 20px; */
/* 	margin-bottom: 10px; */
/* 	border: 1px solid #ccc; */
/* 	border-radius: 4px; */
/* } */

input[id="userId"], input[id="userPw"] {
	width: 99%;
	height: 30px;
	padding: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.vertical-center {
	line-height: 30px;
	/* 이 값을 조정해서 세로 중앙 정렬의 높이를 조절할 수 있음 */
}

input:focus {
	border-color: #0982f0;
	/* 포커스 시 테두리 색상 설정 */
	outline: none;
	/* 포커스 아웃라인 제거 */
}

input[type="button"] {
	font-weight: bolder;
	font-size: 18px;
	background-color: #48D1CC;
	color: white;
	height: 50px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 250px;
	display: block;
	margin: 0 auto;
}

a {
	color: #007bff;
	text-decoration: none;
}

.options {
	position: relative;
	align-items: center;
	height: 20px;
}

.optlab1 {
	left: 0px;
}

.optlab2 {
	right: 0px;
}

.options label {
	margin-right: 20px;
	/* 각 옵션 사이의 간격 조절 */
	position: absolute;
}

.remember-me {
	display: flex;
	align-items: center;
	font-size: 12px;
}

.remember-links {
	font-size: 12px;
	left: 0px;
}

.signup-link {
	margin-top: 10px;
	text-align: right;
	font-size: 12px;
}

.right-links {
	text-align: right;
}

.kakao {
	margin-top: 20px;
	text-align: center;
}
</style>
</head>

<body>
	<script>
		// 로그인 클릭 시 radio 조건 체크
		function login() {
			const logintypes = document.getElementsByName("logintype");

			let selectedLogintype = null;

			for (let i = 0; i < logintypes.length; i++) {
				let item = logintypes[i];
				if (item.checked) {
					selectedLogintype = item.value;
					break;
				}
			}

			if (selectedLogintype) {
				const form = document.getElementById("loginForm");

				if (selectedLogintype === "customer") {
					form.action = "${path}/login";
				} else if (selectedLogintype === "seller") {
					form.action = "${path}/login2";
				}

				form.submit();
			} else {
				alert("로그인 유형을 선택해 주세요. (손님 또는 사장님).");
			}

			// Enter 키 누를 시 로그인 button click과 같은 효과
			document.getElementById("loginButton").addEventListener("keydown",
					function(event) {
						if (event.key === "Enter") {
							login();
						}
					});
		}
	</script>
	<jsp:include page="../base/header.jsp" />
	
	<c:forEach items="${list}" var="item">
	${item}
	</c:forEach>

	<section id="content">
		<div class="container">
			<div id="header-links">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<!-- 사용자가 로그아웃 상태인 경우 -->
						<!-- <a href="${path}/login">로그인</a>-->
					</c:when>
					<c:otherwise>
						<!-- 사용자가 로그인 상태인 경우 -->
						<a href="${path}/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 로그인 폼 -->
			<form class="login-form" action="${path}/login" method="post" id="loginForm">

			
				<div class="login-title">
					<h1>로그인</h1>
				</div>
				<div class="options">
					<label class="optlab1"> <input type="radio"
						name="logintype" value="customer">손님
					</label> <label class="optlab2"> <input type="radio"
						name="logintype" value="seller">사장님
					</label>
				</div>

				<span class="span1"></span> <input type="text" id="userId" name="userId" placeholder="아이디"
					class="vertical-center"> <br> <span class="span1"></span> <input
					type="password" id="userPw"  name="userPw" placeholder="비밀번호"
					class="vertical-center"> <br>

				<!-- 아이디 저장 (Remember Me) 체크박스 -->
				<label class="remember-me"> <input type="checkbox"
					name="rememberMe"> 아이디 저장
				</label>
				<!-- 아이디 찾기와 비밀번호 찾기 링크 -->
				<div class="remember-links right-links">
					<a href="${path}/findIdForm">아이디 찾기</a> | <a href="${path}/findPwForm">비밀번호 찾기</a>
				</div>
				<p class="signup-link">
					<a href="${path}/select_signup">회원가입</a>
				</p>
				<span class="span1"></span>
				<input type="button" id="loginForm" value="로그인" onclick="login()">

				<div class="kakao">
					<label class="kakao_login"> <input type="radio"
						name="option" value="kakao">카카오로 간편 로그인
					</label>
				</div>
			</form>

			<p>
				<a href="${path}/home">홈으로 돌아가기</a>
			</p>
		</div>

	</section>
<jsp:include page="../base/footer.jsp" />


</body>

</html>