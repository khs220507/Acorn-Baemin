<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
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
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

ul {
	list-style: none;
}

/* 헤더 ////////////////////////////////////////////////////*/
header {
	display: flex;
	flex: 1.5;
	justify-content: center;
	align-items: center;
	width: 100vw;
	background-color: #48D1CC;
}
.login-btn {
	color: white;
	font-size: 30px;
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

.logo a {
	color: white;
	font-size: 40px;
}

.info-wrap {
	flex: 5;
}

.address-wrap {
	width: 400px;
	display: flex;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
}

.address-wrap p {
	flex: 5;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.address-wrap img {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.map-icon {
	margin-left: 10px;
}

.search-wrap {
	width: 400px;
	height: 35px;
	display: flex;
	align-items: center;
	background-color: white;
	border-radius: 10px;
	margin: 10px auto;
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

#loginStatus {
	flex: 2.5;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-end;
}
/* 로그인 안했을때 */
.login-btn {
	color: white;
	font-size: 40px;
}
/* 로그인 했을때 */
.hello-msg {
	color: white;
}

.menu-wrap-ul {
	position: relative;
}

.menu-icon {
	width: 40px;
	height: 40px;
}

.hidden-menu {
	width: 180px;
	height: 210px;
	background-color: rgba(71, 209, 205, 0.7);
	border-radius: 10px;
	padding: 10px;
	position: absolute;
	right: 0px;
	display: none;
	transition: .5s;
	z-index: 999;
}

.menu-wrap:hover .hidden-menu, .hidden-menu:hover {
	display: block;
}

.hidden-menu li {
	height: 40px;
	text-align: center;
	position: relative;
}

.menu-items {
	color: white;
}

.hidden-menu img {
	width: 30px;
	height: 30px;
	position: absolute;
	left: 0px;
	top: -3px;
}

/* 카카오맵 모달 */
.kakao-map-modal {
	position: fixed;
	background-color: rgba(0, 0, 0, 0.4);
	top: 0;
	left: 0;
	height: 100vh;
	width: 100%;
	z-index: 999;
	display: none;
}

.kakao-map-modal-content {
	background-color: white;
	width: 700px;
	height: 600px;
	border-radius: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	text-align: center;
}

.close-btn img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 10px;
	right: 10px;
}

.kakao-map-wrap {
	width: 600px;
	height: 500px;
	margin: 0 auto;
	position: relative;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 999;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.set-address-btn {
	width: 600px;
	height: 50px;
	background-color: #48D1CC;
	border: none;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	margin-top: 10px;
}
/* 슬라이더 ////////////////////////////////////////////////////*/
.slider-box {
	flex: 2.5;
	width: 100vw;
	background-color: #d9d9d9;
}
/* 섹션  ////////////////////////////////////////////////////*/
section {
	flex: 5;
	width: 1280px;
	display: flex;
	align-items: center;
}

table {
	width: 100%;
	height: 100%;
	text-align: center;
}

.category {
	width: 120px;
	height: 120px;
	border: 2px solid #48D1CC;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px auto;
}

td img {
	width: 80px;
	height: 80px;
}
/*푸터///////////////////////////////////*/
footer {
	width: 99vw;
	flex:1;
	border-top: 1px solid #d9d9d9;
	padding-top: 20px;
	padding-left: 10px;
}

.footer-text {
	font-size: 13px;
	color: #4B4B4B;
}
</style>
</head>
<body>
	<header>

		<div class="header-wrap">
			<div class="logo">
				<a href="/baemin/home">배달의민족</a>
			</div>
			<div class="info-wrap">
				<div class="address-wrap">
					<p id="address">회원 기본 설정 주소</p>
					<img class="down-arrow-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEMAAABDCAYAAADHyrhzAAAACXBIWXMAAAsTAAALEwEAmpwYAAACFUlEQVR4nO3aS6iMYRzH8cchtyMWCpHYkEhu2ZIiyWVhY2FDOolkY2shnYRkYWNLOoSykJ0kFnIpSwq5lGzkFuXuo+mcKYvpeGfmzDvv+7zPp2Y5m2/N9OvfE0KSJEmSJEmSH4zBeVyv4GdNoyA7VM8DjG4UYxRuqI5fWD7cz2U+vqmGE1n+P/rF7xUmZYkxAc/Ebct/Q9RhvXhdDs3CJfH5hFmtxJiBD+Kyr+kQddgvHvcbboqs0IO7yu8nlrUcog4rhgZKmR0PIwWnxL4pmogxGa+V0+YRC1GHbcrnYugUXBP7psgKc/BFOewNnYaDiu9eW5siK4zFI8XeFEtDXrAKfxTT0dxC1OGM4nmJ3pA3TMVbxbIp9xB16FMcF0I3GTwi3yzIppjZ1Rg1WIQfXY6xOxQFjnUxRO3E0BOKAhPxvEubYkkoGmzoQowjoahwJccQL7qyKbLCbHzOKcbGUHQ4kEOIgVCi5w0POxjiYyE2RVZYid8ditEXygano98UWWEK3kS/KbLC9hGM0R/KzuC7qXY9rT2VCGWHefjaZox1IRY41EaIcyEmGIfHLYR4h2khNljdwhF5V4gVBpoIcbt2SQuxwnS8zxDiOxaG2GFPhhiHQxUYfA10Z5gQTzA+VAUWD3NEXhuqBicbhDgbqgi9Q6e7uDdFVtj6T4ydoepwFbei3hRZYS4WZP5CkiRJkiShBP4C7su4G0s4YJkAAAAASUVORK5CYII=">
					<img class="map-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAACrklEQVR4nO2Zv2sUQRTHN/6IEEliVESNdTRip51c0FYQo8FgY5NWEIREWws5LVRQRJLGwtKAYOslgn9BLAzGRkliIUZFo14sNB8ZfZhF7m7fzM3ObCRfWDjY/b55n72ZeTOzSbKm/1zAXuASMAG8AL7KZX5XgItAT1JUAYeASfQyoAeTogjYCNwBlrGX8dwGNsSG6AKeOADU+ne2xPwnbLpSlp4CrTFATHfyrVsxBrbLmMjSctAJwHOX+leVUBD7yF89IUBMsdNoDhgA2uXqB2aU3pEQIBUlxNY607W5l6XHIUBeKhIZaOA/rfDPhABZVCTS3sDfofAvhgCpNgnSqfBXQ4C8USTS38A/qPDPhQDRrK3M7NRVw7sNmFf4J0KA3FQk8vutysDukGtQCWF0PQTIcfLXsRAgm4HvOUJUgbbcQQTmYY4gD4JACMipHEFOhN5UzeYAMW9iBwMRmOEcQC4EhRAQM6V+8gjx2VT94CACc8MjyLUoEAKyG/jmAeILsDMaiMBc8QByOSqEkez+3jYB8c6Mt6QIAs43AXIuKYqAVmDaAeJ57nUDaAFeZSRyJPV8yfKsyzx7NOU/nOE3BbjFBaSkfKN/D6CB+xYg91K+9cAzhafkAjIq5rKFZwfwQZHQArDdIm5ZfKMuff69mA9Yes8qQM5YxuwV30dgk43RHKYZTdk0qFzmP3KMOWW9OgbGxTTs2OiuOl1swbWCs7JIHbdZDJpd2k9gj0ujEuekz70Gf5ZDP4Al1UchYEganXRtNBVrLAVx1+NXgCG/D2fHapNCOe1jH472JQPd0qWWfO0NZMbp9RSrU3IzOXY3enDEakBFEJqJKFVd6x55xhZZpQHY71R0AousYg1clZtjScHFymxYrrXSfc3q0yywLg3Sx+pVX4ROsaYkS78A4C8IokWKTaoAAAAASUVORK5CYII=">
				</div>
				<form class="search-wrap" action="${path }/search" method="get"
					onsubmit="return validateForm()">
					<input type="text" name="searchTerm">
					<button class="search-btn" type="submit">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADBElEQVR4nO1YzWsTQRQfFb1Z1Ioaj+rJq1Q9W8281NpaMOhB6sG/olUQeq34PwiibW+1Z7+gaJJ5m30vhsZPBKFFb3qsVSJvE7Q7u5UknU0b2R8MISTz2/dm3sfvrVIpUqRI0bMYXCr258iMA5tZIIPAZlmTWZXP5vdZ+T1bfXlAbSdkq94JzWYGGNeAsd7CWtOMj+A1Ht9Sw/PV6h5NeA8Yf7RoeGg1bgfvnkLcvSXhAoxPOzE84gjj4gWiQ10zfhjxIJB5H2sQoacJJ6BcGtCIGTld+cz65rRmnNSM5XhHzDvh7VLYmBcxhr8B8i61wqG5NKIZ38Y48izxcGrGvG38/EhtcW87PPJ/YLMQDScznWi1iSQs4fyden1nJ3yyz3ZCk1m9WCkdc299cPVBqQyFTbsnbwMKhT6Jf4v3oUqo6oTqfJZw2AW3ZjNq94nBpWK/colGhw1XG5f8kerke9dd8qtAHoRiFScc89+yknnGJb9qaJl1J1QuDbjkHyI8Y91wzSW/AsaV9Q84V3l12CX/ec87anXn7y75VVO3/HmANDSX/MIHViIrxzG6HDohxEySNwCEXxLNAdE2ieYAYzXZKsQ46ZJfs7ltdeQHvdMH6vUdQIbC/OamcgkZA+1OLKrSBTf4OGbroaFq8YhKWgsFkrhQ6NsM56jv79OEHyze+yoJyAxrl1PN5nGnajQ/N7dL9tunD+XySZUUZIaNmaYW2r2J4OQt46GxplSSCEZEwudxI2GugpdbSlgfxzThx7jRMkdmXHVlJrY1/N/49UWYSV2X5hSMoIgZYDwbCDa72kT3/wQqXUvcCdHrms2TfxnT6dLihGs5vWE4sZm2E7tlQxv7poDxRmA0h7VQV25CIDOsjIGtvpkTw6VUrq82YixE93fPiYYjlf1y9UG/IKwB4zdN5hew+SraRuSBdNiNmhRsByc2C6hgPtrxu5QTrgD/hRNsrvS+ExSfE/IaRvUKcuRdjThB+Fn1EnJRJ1ZUr0EHb+/MJzl9V3NIihQpUijn+A1qcPW2rNhwowAAAABJRU5ErkJggg==">
					</button>
				</form>
			</div>

			<c:set var="noResults" value="${noResults}" scope="request" />

			<div id="loginStatus">


				<%
				Integer userCodeInfo= (Integer)session.getAttribute("userCode");
				if (userCodeInfo != null) {
				%>
				<p class="hello-msg">
					안녕하세요,
					<%=userCodeInfo%>
					님
				</p>

				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap-ul">
					<li class="menu-wrap"><img class="menu-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMklEQVR4nO3aPU4DMRCGYUuhgZJU/JSEkiwtERULXCDcASQirsE1wm0ioeQWQEcq6HjRaFPR0PBJY/Z7pOnH47VXHrsUMzMzMzMzs18B18ATsACek8Rik9NlUQIegC/yitxmqsEPgU/yixx3FQVoqUerKEBDPU4UBdgCluQXm+LgzwsQgFHyIsTgj4oSMADGwBS4SRLTTU6amTczM+sAh8Ad8JgsIqeDogRcAWvyWsuOxMAO8EZ+L8C2ogDn1GOiKMCEepyplsArfV0CITYY4J28IreLogTsA7cJfns/I3Lakw7ezMz6jq493iRsijbypihwDKzIK1r2I+XMr8hvKfkSgFPqMVYUoKXnl6PDSq7HPyTX4yEeH1TwQOK+KNEdiecJn8jM5UdhMzMzMzMzK//DN5h1UDYzOEebAAAAAElFTkSuQmCC">
						<ul class="hidden-menu">
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACZUlEQVR4nO3aS4hPURwH8CPPlGkKoTxKLMTOwsajKDMrWwtZoDwXliRSomTDwsIjk5KyILYWlCKxIEqKFBbKayHPEh+d5j81aboz///879zz///Pp872dO63e3/nnkcIWZZlWZZlg2A8FmBhQesO7QZdOI9vRuYJ1oR2gevq9x3LQqvDYo07G1odekcRwDscT6Rtj59yIwHMx1/t4W18oxsJ4Zz2cbuRACbiIF60wdsQxz+t7hCK4KbW0tXsAE5pHa+b+vARdmgd10KzYbXWcaCMAKZrHT1NDyDCR61hZigD7ujEAjgAZ3RiARyAvTqxAA7Aep1aACPMlbY/cbYKZcE4fJGue6U9/AA8lK6NoWy4KE2344buWASwT3oeY0bpDx9hg7SK3oWmL32LYNEwg3qDVyW2l7hb2wNcEio6OPlZEMCK0O7wtCCALaHd4UpBACdDu8PhggC+4nTJ+/+HsK7KAHqk4XL8O60igKn4JA3bxjyAqHaGkIKroQqYlMi6oJoABm2UVh1CtdOu/jchVuXPFTz8pUqKYEFh7K0tlso+Bo/1Z+2QA8kqhilxakJfrW3F5FH0twTHanP+CSwPqdJ/0eL5EN/qM8xroL89+D3E0feRkBr9+4UPCgrW/XoKVryBVlvvV7f9VQ+sGkHVXtnEW2sPQkqwewQB7Kqjv7jxUeRHSAk2jyCATXX092iYvt6HlGAOfhUMOO4iza6jv6PDBNAXUoMDBQPeX2df3QWfwft4ShVSpL8WDL5H8AE7R/FW3fhvNrjV0D3AsYQJWFpr45u06FqOWc0ZYZZlWZZlWehs/wCBV7DzRAFk9gAAAABJRU5ErkJggg==">
								<a class="menu-items" href="${path }/">장바구니</a></li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAACPklEQVR4nO3aPWsUQRwH4DGC7/EDCIpRooJaWdhYiDYWFgGxsFFQRFELNYW12IR8BKOWotiIL0F7IY2CNsFWUFQk4gu+J3lkyApXRM3N7eZ2wj6wcHB3/5sfszc7O7MhNBqNRqPRyA424BweYBwf8QXP8RBnsT6hbl9R92FR60tRe7z4rfjehmpSzQLbcd/cTOE6Ns2h7mbcKL4zF/ewLVQFizHcRoNafcd5LJqlbg8Gi8+0axJDsW1lh+1to1f/5SaWttRdhlsl1I293Vtmz95XnlEsKY74nyxLDN1TRuBh5RvBlQrqDpUxQE3Jx2RHA5mZ0y83d1PDbpSvvpTAg/J1NiXwA/kaTQn8XL7GUwJ/lK8PKYG/y9e3lMCv5etlSuCn8vUkJfA1+RpJCXxKvk6kBF6PafmJbV7XduAIj+VnLKTCGfk52UngFZiQj/dYmRw4wiX5uBhKWs96o/7eYnXHgSOcthAvRX9TLKU+Ul9jpSzgtcLWOClXP7FNW0IVcFz9HK0k7B+4qj4uh6qZ2S2owwws3s0trzxwy85hNyckE0krk53ATnzuQti4fbqro8anwt55Xgr6gX2hmzCAX/O0jXIw1AGOVbwHFcMeCXWCQ/hZQdh49hwOdYT9+Fpi2Dg+DIQ6w56SRu9P2B1yYGZf+UUHYV9hR8gJ1iTOyJ5hbcgRVuFOG2Fvd7xE021YhAv/uWxNF48flXtPW4MR/MMsYeMAdyAsROgvnsx7VxzxdX+329VoNBqNRiPMi9/bQE5mUguLBwAAAABJRU5ErkJggg==">
								<a class="menu-items" href="${path }/zzim">찜</a></li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACNUlEQVR4nO2Zu27UQBRAh0cRECH5BUSLoEARX4BEUhDxNSsRVqILElUU0qRBoUGIX6FKSQNRlCq7SLTZoIOG2MRyYnvGM7O+9t4juVjdedw5Gs+1vcYoiqK0ALhvFjlXYAq8qRvcxoDlhPEVh/42x6mJDZf8Bt4Bq4XYPWCUSbLX24TxSUP8HykF5NjJtnLjXGWSxcfAr4r468B45fzzECAaFRAbmslviXHNLRG65evic98B48KhtVU8nbPTOI9PromvFBaSL8wnXhw/r07zFWAuE+myLP6fvxMBklABJfpnuO8CuHg69Loq5mnVV4IAb1zmce3rMnYQvgmoAAdcRLv2lbADRr5XxTyt+nYuoGtUQIm5GyZhyRtEGTQOY/qgAkroDmgQFAwNE6QseVoGHeh8B5hFF0BASWtTJiUKCMJlzrr2LuMF4ZuACvDERXpdewk7YBSzrDWNKU5A10jPLzkqoIRZNIgtAHgGfAKOgBkCSSIAuAm8B/4gnFQC9ugJ0QUAL+kRUQUAt4CfyOcYeA7ciS1gE/mcAY8q8g8WsI98PtfkHyzgEPm8SClginwepBRwhnyWKnK/HUPAhJ7uAOBhqd3pUM+A9YrcN0rtvg21CnypyP1rqd2HoT4FzoDHpbyfXPOyttH2SfAH8jmx5RC4a2+J7HeR7/aFzluABXhF/9k0IQC79JedoMVbgBvZvy/ivwcUOAe2be4mFsAacJCdCxK/CM2y3D4CT6MtXFEURTHD5S+dwCdTx4ClcAAAAABJRU5ErkJggg==">
								<a class="menu-items" href="${path }/orderList">주문내역</a></li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAtElEQVR4nO2SMQrCQBBFF1LkCgpa5xzeySvoXRICQdJppwfQyhukU9FYpHxhYQpZyYhm7PbBwMLu/gcz41zEAmAOlEArVQGZZfiVd27+zkJQMkxhIWgVwePfgruFoFIEuYUgk4GGXIDZaMHLJhW+51K5WXhkECABFsAa2AFn4Cnlz1tgJW+Sb4JTYAk0ynqGNPIn/RQ+BU78zhGYaIKa8Ww0QWcg6DSBCU4RHAzy9+qgIy6gBwTxryZ9UBmqAAAAAElFTkSuQmCC">
								<a class="menu-items" href="${path}/selectUserInfo2?userCode=<%=userCodeInfo%>">내정보수정</a></li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABhElEQVR4nO2ZTUrDQBiGQw+gpoqrKCj4d4lurD+n0I2eQd278AaKiB5EULQFEdSlV7D1Bi7MI8FJGQYsGr/50inzwCyyeb/3nSQzky9JEolEIsECzAMtoF1xtAqNOoyvAPfIcQcsa876O/L0gUwjwJVV9APoANcVR8dolFxoBChmqqQtoLdp6fVkXA4vmFsFGwJ6DUsvl3E5vOCAUdb8kRhgTO/ADLADvElp1jJbwIK0ptcAQGr2lTNgQsahboAjS+4BmJRxqRdgy9lXHoEpGadK7wCwD3xass9AU0JbcxXac0K8ANNS+pUCmPP+wR/Gk61trtNaAgBrzoxW5byuAKtBBygA1oFj4OSX43VkHiGhl7gppe81ACEvo8B20BsZcBj6USI1h7nTIA9zLsBi4htPq9AssKvVlfARQFxTtRgeNMc6QB56Y6tvFdwQ+iorUelKXA7KfTdmu/9o7nbraO7OOXdBip5Ke92EWAJuBc3fFJoq5p0gmcAvpkzdeCQSiSRSfAEe/GNDlGJX4gAAAABJRU5ErkJggg==">
								<a class="menu-items" href="${path }/logout">로그아웃</a></li>
						</ul></li>
				</ul>

			</div>
			<%
			} else {
			%>
			<!-- 로그인 안했을 때 -->
			<a class="login-btn" href="${path }/login">로그인</a>
			<%
			}
			%>

		</div>




	</header>

	<!-- 카카오맵 모달 -->
	<div class="kakao-map-modal">
		<div class="kakao-map-modal-content">
			<a class="close-btn" href=""><img
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg=="></a>
			<div class="kakao-map-wrap">
				<div class="hAddr">
					<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
				</div>
			</div>
			<button class="set-address-btn">
				<strong>이 위치로 주소 설정</strong>
			</button>
		</div>
	</div>

	<!--슬라이더박스-->
	<div class="slider-box"></div>

	<section>

		<table>
			<c:forEach var="category" items="${categories}" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
					<tr>
				</c:if>

				<td>
					<div class="category">
						<a class="category-wrap-a"
							href="${path}/storeList?storeCategory=${category}"> <img
							src="${path}/resources/icons/${category}.png">
							<p>
								<strong>${category}</strong>
							</p>
						</a>
					</div>
				</td>

				<c:if test="${status.index % 4 == 3 or status.last}">
					</tr>
				</c:if>
			</c:forEach>
		</table>

	</section>

	<footer id=footer>
		<div class="footer-info-wrap">
			<p class="footer-text">©2023. Icons8 LLC all rights reserved.</p>
			<p class="footer-text">© 2010-2023 Freepik Company S.L. all rights reserved.</p>
			<p class="footer-text">곽단야, 김민지, 김현수, 박태민, 표준태</p>
		</div>

	</footer>

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



	<!-- 카카오맵-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac76afb73e017bb01fa395c302f99e21&libraries=services"></script>
	<script type="text/javascript">
		var locPosition;

		// 카카오맵 모달 띄우기
		$(".map-icon").click(function() {
			$(".kakao-map-modal").fadeIn();
			map.relayout();
			map.setCenter(locPosition);
		});

		// x버튼 누르면 모달 닫기
		$(".close-btn").click(function() {
			$(".kakao-map-modal").fadeOut();
		});

		// '이 위치로 주소 설정' 버튼 누르면 모달 닫기
		$(".set-address-btn").click(function() {
			$(".kakao-map-modal").fadeOut();

			// 지도에서 선택한 주소로 헤더에 보여주기
			$("#address").html(getAddress);
		});

		var container = document.querySelector('.kakao-map-wrap'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 1
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		/////////////////geolocation API/////////////////
		//map.html

		// 위도 경도 가져오기
		var lat;
		var lon;

		function currentLocation() {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
			if (navigator.geolocation) {

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation
						.getCurrentPosition(function(position) {

							lat = position.coords.latitude, // 위도
							lon = position.coords.longitude; // 경도

							// alert("위도: "+lat+" ,경도: "+lon);

							locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							var message = '<div style="padding:5px; position:relative; bottom:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);
						});
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				locPosition = new kakao.maps.LatLng(37.4812845080678,
						126.952713197762),
						message = '현재 위치를 알 수 없어 기본 위치로 이동합니다.'

				currentLatLon['lat'] = 33.450701
				currentLatLon['lon'] = 126.570667

				displayMarker(locPosition, message);
			}
			return true
		}

		currentLocation();

		////////////////////////// 현위치에 마커와 인포윈도우 표시하기////////////////////////////
		//map.html
		function displayMarker(locPosition, message) {

			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			var imageSize = new kakao.maps.Size(24, 35);

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition,
				image : markerImage,
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);

		}

		////////////////////////// 좌표 주소값 가져오기 ////////////////////////////

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다

		let getAddress;
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					getAddress = result[0].road_address.address_name;
					var detailAddr = !!result[0].road_address ? '<div>'
							+ getAddress + '</div>' : '';

					var content = '<div class="bAddr">'
							+ '<span class="title">도로명 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
	</script>

</body>
</html>