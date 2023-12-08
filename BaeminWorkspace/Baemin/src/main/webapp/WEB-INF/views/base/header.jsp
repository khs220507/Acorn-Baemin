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

input, option, select, textarea {
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
	font-size: 17px;
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

.menu-wrap li:hover {
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
	padding-top: 160px;
	padding-bottom: 50px;
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
@media ( max-width :1280px) {
	header {
		width: 100vw;
		padding: 0 20px;
	}
}

/* 작은화면 */
@media ( max-width :767px) {
	header {
		height: 200px;
	}
	.header-wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.logo {
		margin-bottom: 20px;
	}
	section {
		padding-top: 220px;
	}
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
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAACiklEQVR4nO2ZzWtTURDFf25ixSiIiO22FdutG8FFa2PpX+CytRQLotD/waILrXv3piCIyySk7VYXfrRd+rVx407blaI2FSNXbyAMk7SJM3kv+g4MhMA95x3umzsz90GGDKnEELAArABbwDZQi/EJ2ASKwFVgkBRiEqgAP4D6AWMPKAMTpABngLUOHr5VVIGRpEzMAV8MTDTiMzDbaxO32jzQa+AOMAWMAkdjjMX/7gJv2qxf6pWJ2y0e4AVQ6IDnAvA0KTNziugucA041AVfWHM9ckjeGRwTW+ZEOF7HDbjDybWj5MwwDpCn066RiQYuxnrTrFHBoU7IrQ+vkzVuKDrjlgIVQf68y5zYD4HzpdAqWbYde4I8vAZeKCgdwGkL4gVB/Ap/vBWa8xakK4I0FDtvLAvNBxakW4I0VGdvTAvNDQvSbUF6Fn+MCs2PFqSy6ubxR15ofvcwcgx/HFeq/D/xar23IN1MQbI/syAtCtIwT3jjntC871EQw1DkjXdC87IF6aDSooQm0gtTSpd90oq8rEyDXk2jzMmipcCE0l6Hyc4ai4rOOWuRqhCoGd9JFZTB6iEOGImFqVlox6iln1RG3XAzeQonzCpbX4uTXbeXD4vKToR4AuRwxJIi2uhQL3V4OsnEllEFBpIwU49D0XKszmOxAczH39Ox2Mk60S5K3jszo+SMV5SBw55mhpWLiU7jJ/AYWE/aDPHKpqR0AO3iG/AIOP+b4U8urO6zptILM8Tbjvk4Y2/EIzS0GF+BD/GqJzSAV4ATyvpUmflb5JSWqC5i1fs066WZtcxMAsj9bzuzDhyhDzBwgNOs598fPXbmJn2GnGKm70xoZvrWRHPOuH0szZCB1vgFpd/exdTtQfAAAAAASUVORK5CYII=">
				</button>
			</form>

			<!-- 로그인시 -->
			<div id="loginStatus">


				<%
					Integer userCodeInfo = (Integer) session.getAttribute("userCode");
					String userId = (String) session.getAttribute("user");
					if (userCodeInfo != null) {
					%>
					<!-- 로그인 했을 때 -->
					<ul class="menu-wrap">
				        <% if (userId != null) { %>
				            <a href="${path}/selectUserInfo2?userCode=<%=userCodeInfo%>"><li>내정보수정</li></a>
				            <span class="menu-bar">|</span>
				        <% } %>
					<a href="${path }/orderList"><li>주문내역</li></a>
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