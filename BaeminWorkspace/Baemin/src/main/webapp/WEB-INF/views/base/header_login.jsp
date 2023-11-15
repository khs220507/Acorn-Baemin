<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<style>
/* reset css */
a {
	text-decoration: none;
	color: black;
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'BMHANNAPro';
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

ul {
	list-style: none;
}
input, option, select{
font-family: '';
}
/* 헤더 ////////////////////////////////////////////////////*/
header {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 99vw;
	height: 140px;
	background-color: white;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99999;
	border-bottom: 1px solid #d9d9d9;
}

.login-btn {
	color: black;
	font-size: 20px;
}

.header-wrap {
	width: 1280px;
	display: flex;
}

.logo {
	flex: 2.5;
	display: flex;
	justify-content: center;
	align-items: center;
}

.small-font {
	font-size: 30px;
}

.rider-img {
	width: 85px;
	height: 70px;
}

.logo a {
	color: black;
	font-size: 50px;
	font-weight: bold;
}

/* 섹션 ////////////////////////////////////////////////////////*/
section {
	width: 1280px;
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정*/
	padding-top: 160px;
}

/* 배민 폰트*/
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<header>

	<div class="header-wrap">
		<div class="logo">
			<img class="rider-img" src="${path}/resources/icons/배민캐릭터로고.png">
			<a href="/baemin/home">배달<span class="small-font">의</span>민족
			</a>
		</div>
	</div>

</header>

<!-- 검색 -->
<script>
	function validateForm() {
		var searchTerm = document.getElementsByName('searchTerm')[0].value;
		if (searchTerm.trim() === '') {
			alert('검색어를 입력하세요');
			return false;
		}
		return true;
	}
</script>