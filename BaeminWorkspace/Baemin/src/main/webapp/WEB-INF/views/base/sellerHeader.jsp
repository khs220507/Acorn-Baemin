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
section{
width: 1280px;
padding-top: 140px;
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
	justify-content: flex-end;
}

.menu-wrap li {
	font-size: 22px;
	font-weight: bold;
}
.menu-wrap li:hover{
	color: #48D1CC;
}

.menu-bar {
	color: #d9d9d9;
	margin: 10px;
	font-size: 20px;
}
/* 섹션 ////////////////////////////////////////////////////////*/
section {
	width: 1280px;
	padding-bottom: 50px;
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

/* 반응형 /////////////////////////////////////////////////////////////////*/

/* 중간화면 */
@media (max-width:1280px) {
	header{
		width: 100vw;
		padding: 0 20px;
	}
}

@media (max-width:767px) {
	header{
		height: 200px;
	}
	.header-wrap {
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	}
	section{
		padding-top: 220px;
	}
}
</style>

<header>

	<div class="header-wrap">
		<div class="logo">
			<img class="rider-img" src="${path}/resources/icons/배민캐릭터로고.png">
			<a href="/baemin/sellerHome?sellerCode=<%= session.getAttribute("user")%>">배달<span class="small-font">의</span>민족<br><span class="small-font">사장님</span>
			</a>
		</div>

		<div class="wrap-menu-address">
			
			<!-- 로그인시 -->
			<div id="loginStatus">


				<%
				Integer userCodeInfo = (Integer) session.getAttribute("user");
				if (userCodeInfo != null) {
				%>
				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap">
					<a href="${path}/selectUserInfo3?userCode=<%=userCodeInfo%>"><li>내정보수정</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/logout"><li>로그아웃</li></a>
				</ul>

			</div>
			<%
			} else {
			%>
			<!-- 로그인 안했을 때 -->
			<ul class="menu-wrap">
			<a href="${path}/selectUserInfo2?userCode=<%=userCodeInfo%>"><li>내정보수정</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/login"><li>로그인</li></a>
			</ul>
			<%
			}
			%>

		</div>

	</div>

</header>
