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
</style>


</head>


<body>
	<jsp:include page="../base/header.jsp"/>
	
	<c:out value="${menuCode}"/>
	
	
	
	




	<section>
	<div class="cart-title">장바구니</div>
	<div class="cart-store-wrap">
	<img class="store-img" src="">
	<div>$</div> 
	</div>
		

	</section>
	
	<jsp:include page="../base/footer.jsp" />

</body>
</html>