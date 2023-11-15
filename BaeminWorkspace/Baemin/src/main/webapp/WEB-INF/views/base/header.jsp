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
	justify-content: flex-start;
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


.search-wrap {
	width: 250px;
	height: 40px;
	display: flex;
	align-items: flex-end;
	background-color: white;
	border-bottom: 2px solid black;
	position: absolute;
    right: 0;
    top: -30px;
}

.search-wrap input {
	width: 360px;
	height: 30px;
	margin-left: 10px;
	border: none;
	outline: none;
}

.search-btn {
	border: none;
	background: none;
}

.search-wrap img {
	width: 25px;
	height: 25px;
	cursor: pointer;
}

/* 메뉴바 */
.wrap-menu-address {
	display: flex;
	flex-direction: column;
	justify-content: center;
	position: relative;
	top: 10px;
}

.menu-wrap {
	display: flex;
	align-items: center;
	margin-top: 20px;
}

.menu-wrap li {
	font-size: 22px;
	font-weight: bold;
}

.menu-bar {
	color: #d9d9d9;
	margin: 10px;
	font-size: 20px;
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

		<div class="wrap-menu-address">
			<form class="search-wrap" action="${path }/search" method="get"
				onsubmit="return validateForm()">
				<input type="text" name="searchTerm">
				<button class="search-btn" type="submit">
					<img
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADBElEQVR4nO1YzWsTQRQfFb1Z1Ioaj+rJq1Q9W8281NpaMOhB6sG/olUQeq34PwiibW+1Z7+gaJJ5m30vhsZPBKFFb3qsVSJvE7Q7u5UknU0b2R8MISTz2/dm3sfvrVIpUqRI0bMYXCr258iMA5tZIIPAZlmTWZXP5vdZ+T1bfXlAbSdkq94JzWYGGNeAsd7CWtOMj+A1Ht9Sw/PV6h5NeA8Yf7RoeGg1bgfvnkLcvSXhAoxPOzE84gjj4gWiQ10zfhjxIJB5H2sQoacJJ6BcGtCIGTld+cz65rRmnNSM5XhHzDvh7VLYmBcxhr8B8i61wqG5NKIZ38Y48izxcGrGvG38/EhtcW87PPJ/YLMQDScznWi1iSQs4fyden1nJ3yyz3ZCk1m9WCkdc299cPVBqQyFTbsnbwMKhT6Jf4v3oUqo6oTqfJZw2AW3ZjNq94nBpWK/colGhw1XG5f8kerke9dd8qtAHoRiFScc89+yknnGJb9qaJl1J1QuDbjkHyI8Y91wzSW/AsaV9Q84V3l12CX/ec87anXn7y75VVO3/HmANDSX/MIHViIrxzG6HDohxEySNwCEXxLNAdE2ieYAYzXZKsQ46ZJfs7ltdeQHvdMH6vUdQIbC/OamcgkZA+1OLKrSBTf4OGbroaFq8YhKWgsFkrhQ6NsM56jv79OEHyze+yoJyAxrl1PN5nGnajQ/N7dL9tunD+XySZUUZIaNmaYW2r2J4OQt46GxplSSCEZEwudxI2GugpdbSlgfxzThx7jRMkdmXHVlJrY1/N/49UWYSV2X5hSMoIgZYDwbCDa72kT3/wQqXUvcCdHrms2TfxnT6dLihGs5vWE4sZm2E7tlQxv7poDxRmA0h7VQV25CIDOsjIGtvpkTw6VUrq82YixE93fPiYYjlf1y9UG/IKwB4zdN5hew+SraRuSBdNiNmhRsByc2C6hgPtrxu5QTrgD/hRNsrvS+ExSfE/IaRvUKcuRdjThB+Fn1EnJRJ1ZUr0EHb+/MJzl9V3NIihQpUijn+A1qcPW2rNhwowAAAABJRU5ErkJggg==">
				</button>
			</form>

			<!-- 로그인시 -->
			<div id="loginStatus">


				<%
				Integer userCodeInfo = (Integer) session.getAttribute("userCode");
				if (userCodeInfo != null) {
				%>
				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap">
					<a href="${path}/selectUserInfo2?userCode=<%=userCodeInfo%>"><li>내정보수정</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/orderList"><li>주문내역</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/orderList"><li>알림</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/zzim"><li>찜</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/logout"><li>로그아웃</li></a>
				</ul>

			</div>
			<%
			} else {
			%>
			<!-- 로그인 안했을 때 -->
			<ul class="menu-wrap">
				<a href="${path }/login"><li>내정보수정</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>주문내역</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/orderList"><li>알림</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>찜</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>로그인</li></a>
			</ul>
			<%
			}
			%>

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