<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
<style>
    .findPwResult-form {
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
.findPwResult-title{
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
<!-- 생략된 부분은 유지 -->

<body>
    <!-- 비밀번호 찾기 결과 폼 -->
    <form class="findPwResult-form" id="findPw-form">
        <div class="findPwResult-title">
            <h1>비밀번호 찾기 결과</h1>
            <br>            
        </div>
        
        <p id="customerPw" style="display: ${customerPw ? 'block' : 'none'};">손님 비밀번호 : ${customerPw}</p>
        <p id="sellerPw" style="display: ${sellerPw ? 'block' : 'none'};">사장님 비밀번호 : ${sellerPw}</p>
        
        <!-- 결과값이 없을 때 -->
        <p id="noResultMessage" style="display: ${!customerPw && !sellerPw ? 'block' : 'none'};">결과가 없습니다.</p>
    </form>

    <script>
    let customerPw = "${customerPw}";
    let sellerPw = "${sellerPw}";

    // 결과를 보여줄 요소 선택
    let customerElement = document.getElementById("customerPw");
    let sellerElement = document.getElementById("sellerPw");
    let noResultMessage = document.getElementById("noResultMessage");

    // customerPw가 존재하면 해당 요소 보이기
    if (customerPw && customerPw.length > 0) {
        customerElement.style.display = "block";
        noResultMessage.style.display = "none"; // 결과가 있으면 결과 없음 메시지 숨기기
    }

    // sellerPw가 존재하면 해당 요소 보이기
    if (sellerPw && sellerPw.length > 0) {
        sellerElement.style.display = "block";
        noResultMessage.style.display = "none"; // 결과가 있으면 결과 없음 메시지 숨기기
    }

    // 결과값이 없을 때 해당 요소 보이기
    if (!customerPw && !sellerPw) {
        noResultMessage.style.display = "block";
    }
</script>
</body>
</html>

