<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
<style>
    .findIdResult-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	/* 폼의 최대 너비 설정 */
	width: 100%;
	border: 3px solid #82d9d0;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
	position: absolute;
	top: 250px;
}
a{
	text-style: none;
}
.findIdResult-title{
	text-align: center;	
}
input[type="button"] {
	font-weight: bolder;
	font-size: 20px;
	background-color: #82d9d0;
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
</style>
</head>
<jsp:include page="../base/header_login.jsp" />
<body>
    <!-- 아이디찾기 폼 -->
	<form class="findIdResult-form" 
		id="findId-form">


		<div class="findIdResult-title">
			<h1>아이디 찾기 결과</h1>
			<br>			
		</div>
		
    <p id="customerId" style="display: none;">손님 아이디 : ${customerId}</p>
    <p id="sellerId" style="display: none;">사장님 아이디: ${sellerId}</p>
    <div><a href="${path}/findPwForm">비밀번호 찾기</a></div>
    
</form>
    <script>
        let customerId = "${customerId}";
        let sellerId = "${sellerId}";

        // 결과를 보여줄 요소 선택
        let customerElement = document.getElementById("customerId");
        let sellerElement = document.getElementById("sellerId");

        // customerId가 존재하면 해당 요소 보이기
        if (customerId && customerId.length > 0) {
            customerElement.style.display = "block";
        }

        // sellerId가 존재하면 해당 요소 보이기
        if (sellerId && sellerId.length > 0) {
            sellerElement.style.display = "block";
        }
    </script>
    
    
</body>
</html>
