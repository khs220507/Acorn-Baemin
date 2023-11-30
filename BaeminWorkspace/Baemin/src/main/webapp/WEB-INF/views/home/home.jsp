<%@ page session="true" %>
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
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
input{
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
	z-index: 99;
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

.info-wrap {
	flex: 5;
}

.address-wrap {
	width: 420px;
	display: flex;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
	border-bottom: 3px solid black;
	padding-bottom: 5px;
}

.address-wrap p {
	flex: 5;
	color: black;
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
#address-list{
	border: 1px solid black;
	width: 100%;
	position: absolute;
	top: 28px;
	background-color: white;
	display: none;
}
.addressList-item{
	border-bottom: 1px solid #d9d9d9;
	padding: 10px;
	position: relative;
}
.address-home-icon{
	width: 18px;
	height: 18px;
	margin-right:5px;
}
.home-address-item-wrap{
	display: flex;
	align-items: center;
}
.deliveryAddress{
	font-size: 18px;
}
.detailDeliveryAddress{
	font-size: 16px;
	color: gray;
}
.address-x-btn{
	width: 20px;
	height: 20px;
	position: absolute;
	right: 10px;
	top: 8px;
}
.search-wrap {
	width: 410px;
	height: 40px;
	display: flex;
	align-items: center;
	background-color: white;
	border: 2px solid black;
	border-radius: 10px;
	margin: 10px auto;
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

/* 도로명 모달  */
#doro-back{
position: fixed;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 998;
	display: none;
		 
}
#doro-wrap{
	background-color: white;
	position: absolute;
	padding: 20px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 20px;

}
#doro{
    width: 500px!important;
    height: 500px!important;
    margin: 0 auto;
    border: 3px solid #d9d9d9;
    border-radius: 10px;
    padding: 10px;
;
}
#doro-add-but{
	width: 500px;
	height: 50px;
	background-color: #48D1CC;
	border: none;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	margin-top: 10px;
}

#doro-text{
    color: #4b4b4b;
    margin-top: 10px;
    padding: 10px;
    font-size: 25px;
    width: 500px;
    text-align: center;
    border: 2px solid #d9d9d9;
    border-radius: 10px;
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
	width: 50vw;
	height: 70vh;
	border-radius: 10px;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	text-align: center;
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.close-btn img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 9999;
}

.kakao-map-wrap {
	width: 45vw;
	height: 65vh;
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
	width: 45vw;
	height: 50px;
	background-color: #48D1CC;
	border: none;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	margin-top: 10px;
}
/* 슬라이더 ////////////////////////////////////////////////////*/
.slider-all-wrap {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 140px;
}

.slider-wrap {
	width: 99.5vw;
	height: 80%;
	position: relative;
	overflow: hidden;
}

.slider-box {
	width: 100%;
	height: 100%;
	position: relative;
}

.slider-img {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.slider-img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
	position: relative;
}

.pager {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 20px;
	display: flex;
	justify-content: center;
	gap: 20px;
	z-index: 1;
}

.pager a {
	width: 15px;
	height: 15px;
	background: rgba(0, 0, 0, .2);
	display: flex;
	border-radius: 50%;
	text-indent: -9999em;
}

a.active {
	background: #000;
}

.category-title {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.category-title h2 {
	font-size: 40px;
}
/* 섹션  ////////////////////////////////////////////////////*/
section {
	width: 1280px;
	display: flex;
	align-items: center;
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정*/
	margin: 0 auto;
	position: relative;
}

table {
	width: 100%;
	height: 100%;
	text-align: center;
	display: flex;
	justify-content: center;
	margin-bottom: 40px;
	margin-top: 20px;
}

.category {
	width: 150px;
	height: 150px;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px auto;
	border: 2px solid black;
}

td {
	width: 300px;
}

td img {
	width: 80px;
	height: 80px;
}

.category p {
	font-size: 18px;
	color: black;
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

/* 홈화면 꾸미기 */
footer {
	border-top: 5px solid #d9d9d9 !important;
}

.store-img {
	width: 200px;
	height: 170px;
	position: absolute;
	bottom: -41px;
	right: -130px;
}

.home-img {
	width: 180px;
	height: 150px;
	position: absolute;
	bottom: -27px;
	left: -130px;
}

.rider-bottom-img {
	width: 80px;
	height: 70px;
	position: absolute;
	bottom: -20px;
	right: 55px;
	animation: moveLeft 120s linear infinite;
}
/* @keyframes를 통한 애니메이션 정의 */
@keyframes moveLeft {
    0% {
        transform: translateX(0%); /* 시작 위치: 오른쪽 끝에서 시작 */
    }
    100% {
        transform: translateX(-1350%); /* 종료 위치: 왼쪽 끝으로 이동 */
    }
}

/* 반응형////////////////////////////////////////////////////////////////////////////////////// */

  /* 중간화면 //////////////////////*/
@media (max-width: 1280px) {
	header{
		height: 200px;
	}
 	section{
		width: 100vw;
	}
	.slider-wrap {
		height: 60%;
	}
	.category-title {
    margin-top: 80px;
	}

	/* 홈화면 꾸민거 없애기 */

	.store-img {
		display: none;
	}

	.home-img {
		display: none;
	}

	.rider-bottom-img {
		display: none;
	}
	/* 카카오맵 모달 */
	.kakao-map-modal-content{
			top: 62%;
		}
}
/* 푸터  ////////////////////////////////////////////////////*/
footer {
	width: 97vw;
	height: 80px;
	border-top: 1px solid #d9d9d9;
	margin-top: 20px;
	padding-top: 20px;
	padding-left: 10px;
	padding-bottom: 5px;
	position: fixed;
	bottom: 0;
}

p {
	font-size: 13px;
	color: #4B4B4B;
}
.copyright{
	width:10px;
	height: 10px;
}

  /* 작은화면 ///////////////////////////*/

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
		width: 100vw;
	}
	.slider-all-wrap{
		margin-top: 100px;
		height:70vh;
	}
	.slider-wrap {
	height: 100%;
	}
	.category-title {
    margin-top: 80px;
	}

	/* 카테고리 행,열 바꾸기 */
	tr {
    display: block;
    width: 100%;
 	}
  
	td {
		display: block;
		width: 33.33%; /* 3열을 4행으로 바꾸기 위해 각 셀이 33.33%의 너비를 가지도록 설정 */
		float: left;
	}

	/* 홈화면 꾸민거 없애기 */
	.store-img {
		display: none;
	}

	.home-img {
		display: none;
	}

	.rider-bottom-img {
		display: none;
	}

	/* 카카오맵 모달 */
	.kakao-map-modal-content{
		top: 62%;
	}
}

</style>
</head>
<body style="overflow-x: hidden">
	<header>

		<div class="header-wrap">
			<div class="logo">
				<img class="rider-img" src="${path}/resources/icons/배민캐릭터로고.png">
				<a href="${path}/home">배달<span class="small-font">의</span>민족
				</a>
			</div>

			<div class="wrap-menu-address">
				<div class="address-wrap">
				
				<%
					Integer userCodeInfo = (Integer) session.getAttribute("userCode");
					if (userCodeInfo != null) {
					%>
					<!-- 로그인 했을 때 -->
					<p id="address">${deliveryAddress}</p>
					<img class="down-arrow-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABB0lEQVR4nO3XPyvFURzH8RciUVJKGZTBcDeLxWKyeAAmT4AnwKp4AEx3tpksNoPJYjEowx0MyqDoppTkT9fyGwzy597z+6fvq854Ou/PeAghhBBCCP/aFp7QKfg8ZW/3rF1CfCc79ykGNEsc0EwxYBjnJcRfYEQis3goMP4RDYmtFDhgVU72CojflaNBnOYYf4YhOZvGXQ7xbcwoyBLeEsa/Y1nBdhIO2FaCfhwniD/BgJJM4qaH+FtMKdkCXrqIf8WiitjsYsCGCunD4R/ij7I7lTKOq1/EX2NCRc398Pl5xryKW/9mwJqa2P8i/kCNjOLyU3wLY2qmkYW38vichBBCCCEE9fcBzZeL0obnNdUAAAAASUVORK5CYII=">
					<img class="map-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAADlUlEQVR4nO2YTUgVURTH/5op5WdRZErYpqSUonLTJ7V+lfa5qJ2rItr5fLQpSjOCIAyhhD72GURFm8zCImhnC8U+oLKEvqW0sojeixP/gdvjzcydefPuDOEPLgzv3PO/d94999w7B5ji/6cWQALAbQDDAL6yyXMvgFYAixFhGgD0AUhpNnnRVYgQ0wF0AUhygp8AnAewlatTzCbPjQAusE+KPmcAFIT9ErMA3OGkvgFoA1Cm4Sd92gF8V1anAiGuhBVKowwtrywH8JIa/QAKEQJdnMArAFVZ6Ijva2p1wjANjG8JpxUB6K1kmP3mszGskJI9ERTHqSkp2gi1SnZy2tib+cJyhkzwOebQvxzAGLUXwQAJDiZp1I52h/PDaRUvsU8cBujlYHIm2K2E2H8AaAEwny3O31IOK7ON9lswwBMOZnfNsM4VeYl0WmmTMHMK28cwwAQHK3GxV2awVdI2buNbQrto5BzrNJ5hYx+nXcIpnWravtj4Fiu3hJwzysFqXFJz3CFR2IXWQtrlgMw5/S4bNqZs9lae3FV8iZ8uvltovwsDdHIwSbF2tPlMvx3scxoG2MHBhlz6xRhCE5oHojBMbUnDOadMCZH6AHWXUVO0S2GImxz0aICax6h5AwbZzUGfAsgPQE80nlFzFwxSBOAtB5ZP2mxppNYbahvlEAe/H4DWA2olEAKy6T9zAquz0FmrnPYVCIlTnMTVLDSuU+MkQqSady/57F3jw3+dcrfKdDczivWJ+hBAns+9Iak3dEqZbWRC2z347aTPO81amBH2K+eKTvosYl/x2YcIUQBg0EOYWJfKQRPl0jwAz10K0RvTNm6Sd6U6B9169pG+m9LScNJhrBEfe/Av6zUq6un/6EVl40+zuYpYG1wK3RbS95HGeDInz5yjs2QlXWYDeE+/AxnsB2n7CGCOB90O+smcPFGolP6dwiQTe5WTeoHye43yPb/Ho2adUhT0VOhuouMA/HGF/vcYNvlKmeiaT80Bl3paRnocalM6zOX5IBqHARzh8wcA83xqtlDjsq6D1GAnWRmXK4hfrKrhL7ZsP2GrOadJztGVZpeSjZ+EIe1sAHp91GoOvLMLM1mkGOJztjTr/smel0+DJWxBUK4b9nG+sWz2qNKjk4is01XSb1RpcjsalrLDWBgFAA8U8mZgW1c7QWM3ok835ypXl3+QW+ULjUtb1NpIel1tQwQm5bfJ3KdA1PgDYpWe90NC9SoAAAAASUVORK5CYII=">
				</div>
				
				<div id="address-list">
					<!-- <c:forEach var="addressList" items="${addressList }">
						<div id="addressList-item">
							<p class="deliveryAddress">${addressList.deliveryAddress}</p>
							<p class="detailDeliveryAddress"> ${addressList.detailDeliveryAddress}</p>
						</div>
					</c:forEach> -->
				</div>
				
				
				<%
				} else {
				%>
				<!-- 로그인 안했을 때 -->
				<p id="address">주소를 선택하려면 로그인이 필요합니다</p>
				<img class="down-arrow-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABB0lEQVR4nO3XPyvFURzH8RciUVJKGZTBcDeLxWKyeAAmT4AnwKp4AEx3tpksNoPJYjEowx0MyqDoppTkT9fyGwzy597z+6fvq854Ou/PeAghhBBCCP/aFp7QKfg8ZW/3rF1CfCc79ykGNEsc0EwxYBjnJcRfYEQis3goMP4RDYmtFDhgVU72CojflaNBnOYYf4YhOZvGXQ7xbcwoyBLeEsa/Y1nBdhIO2FaCfhwniD/BgJJM4qaH+FtMKdkCXrqIf8WiitjsYsCGCunD4R/ij7I7lTKOq1/EX2NCRc398Pl5xryKW/9mwJqa2P8i/kCNjOLyU3wLY2qmkYW38vichBBCCCEE9fcBzZeL0obnNdUAAAAASUVORK5CYII=">
				<img class="map-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAADlUlEQVR4nO2YTUgVURTH/5op5WdRZErYpqSUonLTJ7V+lfa5qJ2rItr5fLQpSjOCIAyhhD72GURFm8zCImhnC8U+oLKEvqW0sojeixP/gdvjzcydefPuDOEPLgzv3PO/d94999w7B5ji/6cWQALAbQDDAL6yyXMvgFYAixFhGgD0AUhpNnnRVYgQ0wF0AUhygp8AnAewlatTzCbPjQAusE+KPmcAFIT9ErMA3OGkvgFoA1Cm4Sd92gF8V1anAiGuhBVKowwtrywH8JIa/QAKEQJdnMArAFVZ6Ijva2p1wjANjG8JpxUB6K1kmP3mszGskJI9ERTHqSkp2gi1SnZy2tib+cJyhkzwOebQvxzAGLUXwQAJDiZp1I52h/PDaRUvsU8cBujlYHIm2K2E2H8AaAEwny3O31IOK7ON9lswwBMOZnfNsM4VeYl0WmmTMHMK28cwwAQHK3GxV2awVdI2buNbQrto5BzrNJ5hYx+nXcIpnWravtj4Fiu3hJwzysFqXFJz3CFR2IXWQtrlgMw5/S4bNqZs9lae3FV8iZ8uvltovwsDdHIwSbF2tPlMvx3scxoG2MHBhlz6xRhCE5oHojBMbUnDOadMCZH6AHWXUVO0S2GImxz0aICax6h5AwbZzUGfAsgPQE80nlFzFwxSBOAtB5ZP2mxppNYbahvlEAe/H4DWA2olEAKy6T9zAquz0FmrnPYVCIlTnMTVLDSuU+MkQqSady/57F3jw3+dcrfKdDczivWJ+hBAns+9Iak3dEqZbWRC2z347aTPO81amBH2K+eKTvosYl/x2YcIUQBg0EOYWJfKQRPl0jwAz10K0RvTNm6Sd6U6B9169pG+m9LScNJhrBEfe/Av6zUq6un/6EVl40+zuYpYG1wK3RbS95HGeDInz5yjs2QlXWYDeE+/AxnsB2n7CGCOB90O+smcPFGolP6dwiQTe5WTeoHye43yPb/Ho2adUhT0VOhuouMA/HGF/vcYNvlKmeiaT80Bl3paRnocalM6zOX5IBqHARzh8wcA83xqtlDjsq6D1GAnWRmXK4hfrKrhL7ZsP2GrOadJztGVZpeSjZ+EIe1sAHp91GoOvLMLM1mkGOJztjTr/smel0+DJWxBUK4b9nG+sWz2qNKjk4is01XSb1RpcjsalrLDWBgFAA8U8mZgW1c7QWM3ok835ypXl3+QW+ULjUtb1NpIel1tQwQm5bfJ3KdA1PgDYpWe90NC9SoAAAAASUVORK5CYII=">
			</div>
			<%
			}
			%>
				

				<!-- 로그인시 -->
				<div id="loginStatus">

					<%
					Integer addressCode = (Integer) session.getAttribute("addressCode");
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
	<!-- 도로명 모달 -->
	<div id="doro-back">

			<div id="doro-wrap">
				
				<div id="doro">
				</div>
				<div id="doro-text-wrap">
					<input id="doro-text" readonly>
				</div>
				<div >
					<button id="doro-add-but">
						<strong>이 위치로 주소 설정</strong>
					</button>
				</div>
			</div>
	</div>

	<div id="content">
		<!--슬라이더박스-->
		<div class="slider-all-wrap">
			<div class="slider-wrap">
				<div class="pager">
					<a href="#slide2">2</a> <a href="#slide3">3</a> <a href="#slide4">4</a>
					<a href="#slide5">5</a> <a href="#slide7">7</a>
				</div>


				<ul class="slider-box">
					<li class="slider-img" id="slide2"><img
						src="${path}/resources/images/slider3.png"></li>
					<li class="slider-img" id="slide3"><img
						src="${path}/resources/images/slider2.jpg"></li>
					<li class="slider-img" id="slide4"><img
						src="${path}/resources/images/slider4.jpg"></li>
					<li class="slider-img" id="slide5"><img
						src="${path}/resources/images/slider5.jpg"></li>
					<li class="slider-img" id="slide7"><img
						src="${path}/resources/images/slider7.png"></li>
				</ul>
			</div>
			<div class="category-title">
				<h2>MENU</h2>
				<form class="search-wrap" action="${path }/search" method="get"
					onsubmit="return validateForm()">
					<input type="text" name="searchTerm">
					<button class="search-btn" type="submit">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAACiklEQVR4nO2ZzWtTURDFf25ixSiIiO22FdutG8FFa2PpX+CytRQLotD/waILrXv3piCIyySk7VYXfrRd+rVx407blaI2FSNXbyAMk7SJM3kv+g4MhMA95x3umzsz90GGDKnEELAArABbwDZQi/EJ2ASKwFVgkBRiEqgAP4D6AWMPKAMTpABngLUOHr5VVIGRpEzMAV8MTDTiMzDbaxO32jzQa+AOMAWMAkdjjMX/7gJv2qxf6pWJ2y0e4AVQ6IDnAvA0KTNziugucA041AVfWHM9ckjeGRwTW+ZEOF7HDbjDybWj5MwwDpCn066RiQYuxnrTrFHBoU7IrQ+vkzVuKDrjlgIVQf68y5zYD4HzpdAqWbYde4I8vAZeKCgdwGkL4gVB/Ap/vBWa8xakK4I0FDtvLAvNBxakW4I0VGdvTAvNDQvSbUF6Fn+MCs2PFqSy6ubxR15ofvcwcgx/HFeq/D/xar23IN1MQbI/syAtCtIwT3jjntC871EQw1DkjXdC87IF6aDSooQm0gtTSpd90oq8rEyDXk2jzMmipcCE0l6Hyc4ai4rOOWuRqhCoGd9JFZTB6iEOGImFqVlox6iln1RG3XAzeQonzCpbX4uTXbeXD4vKToR4AuRwxJIi2uhQL3V4OsnEllEFBpIwU49D0XKszmOxAczH39Ox2Mk60S5K3jszo+SMV5SBw55mhpWLiU7jJ/AYWE/aDPHKpqR0AO3iG/AIOP+b4U8urO6zptILM8Tbjvk4Y2/EIzS0GF+BD/GqJzSAV4ATyvpUmflb5JSWqC5i1fs066WZtcxMAsj9bzuzDhyhDzBwgNOs598fPXbmJn2GnGKm70xoZvrWRHPOuH0szZCB1vgFpd/exdTtQfAAAAAASUVORK5CYII=">
					</button>
				</form>
			</div>
		</div>

		<!--섹션-->

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

			<!-- 홈화면 꾸미기 -->
			<!-- 가게이미지 -->
			<img class="store-img"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAFBklEQVR4nO2aT2hcdRDH3yXvlRp6kEbQJGt3IyvmUNODl5wsHoTqIZd2EdFSut5UevIgVaEULEhbhLISKWRb/xDi0oTaXsQ2+yJLKwgbYrq7h0iVtAYLBbt/UkiNU+alDdEmuzPb39u3m/1+YS7N7uzMfN5v5jePWhYEQRAEQRAEQRAEQRAEVRHF+nopFklRLFykWITa28JF2hc+R3t3PN/I4t8OPvFIs9ltevO5ngYA4Cc/8GSpSW2sAQDQdmgjAPvCdxoAIPCnjJrZACAGAIE/hYQTEHwhCC0o+GJQAIYZENvEAGiyY4Bch2raZXteFPDbz/4t8semLYbUL8cg8cc5SfxNdgz4ByDtnBQFkXriJ1FS7/cUAgfAMUj8cU4Sf2nnpD/F/8XqoLR9SxTEZ9tlAI48dTVwAByDxB/nJAJg3+JamQcwZQ+Jk3onJGtBp55MBw6AY5D445ykPqfsIfMA0s640f7P9u224AFwDFKf0jmQdsbNFn+qs4vSzpLR/s92fmvwLYhjkPqUz4Elrpk5AK59SJyQtP+z/bgl+CHMMUh9SueAZ/YhgwCcrPH+z5Z2gr+GcgxSn5o54DrZxt79tf1fswO4PgLQ7AKaOWBqJxDf/bX9X7MDuD4DkO4CmjlgYidQ3f21/V+zA7g+A5DuAto58Lg7geruzxbv/VOciGYHcH0GIN0F2DhHje/H2QnEd3+2SeeGqkDfbJtqGgAci8Y35ypvQ+P+3/1dh5aSnb+pkvje+b1pAFzYcl3j+96ZzjkFgPp2AtXd33Vo8fD2kqpAP9h3mwYAx6LwffejrqLKfz07AV2yFzQ/cu9AaFl5jP9tGgAci+YEcK4a/5fsv/QARqwSJS2S2D9fdVJhT4gKr3SJLP/aDlo+u5XaxT+NWPr/rkIj1s/SHyinBih38GVxAvzZSupFahf/lLSu1APgPekPzLuf0K/Dn4oTmBk+RjfSH1O7+Kek9a4ewOeWQ0krW8v54ncv0HQ+T9nZPOX2D9Z+evYPUvZanqZzOe+7m92/V8Mxy1YD8CAkre5qEDiA2ZkMZQtznk1fvVI1Cf4bf+bh52dnMlWTaHX/D2rXXVfxVyGMWTYfIe6TPHjYyqld3rH1npwHwazatbx3RL2eyoNtT4hy8d3ev/Hf/v/56Xze87XZ/HPN6n7y19MjgcKoWg2MFR4A5up62ACgEOwpBYACAHhPwnxxuaUt2+onIOgCzgPAShHCiZJRe/qDmf+YCZ+RRIleSpZp77nK5jsBzQyg74sSDZ4t0xsTFYpfXPQMABL+A4gOl2j31xV66/xK0dcaACT8A9D/ZZleHa3QgQuPFh4AEv61oJ2nS/T6WIUOblB0AEiYnwFrB2utogNAwhyA9QYrADTgFhStMlgBwEcA/YLBCgA+AHjmwxz1HLkuGqwAYKj4kUSJug8XqPfoHxQ6dtMzk8XHHpBYv/BrB+vDwgNAA15FRNcZrADQgHdB/VUGKwD4CGCnYGMFAMMAIsqNFQAMAejbYGMdGr1D0eMLng2NFtUAan2/7W9BtTbW6PGF1eJGTyyoAdT6ftsCkG6sUQAwC0DzKjjutZDiSgs5UW8Lqv79tjsBpjfVEBYxAMjiBNzEqwi0oDnMgBDehmIIZ/2+BU1czlA91uq3oIk68waAiwCAE2BSaEEZtKA4ZgCG8ASG8CJuQbiGZhp/DYUgCIIgCIIgCIIgCIKsVtd9o3AHQ3Ov4D0AAAAASUVORK5CYII=">

			<!-- 집 이미지 -->
			<img class="home-img"
				src="data:image/png;base64,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">

			<img class="rider-bottom-img"
				src="${path}/resources/icons/배민캐릭터로고.png">

		</section>
	</div>
<footer id=footer>
	<div class="footer-info-wrap">
		<p>에이콘아카데미 최종프로젝트 배달의민족 점심뭐먹조</p>
		<p>곽단야, 김민지, 김현수, 박태민, 표준태</p>
	</div>

</footer>

<script>
	// 문서의 높이를 조절하는 함수
	function adjustDocumentHeight() {
		var contentHeight = document.getElementById('content').offsetHeight;
		var windowHeight = window.innerHeight;
		var footerHeight = document.getElementById('footer').offsetHeight;

		if (contentHeight + footerHeight < windowHeight) {
			// 내용이 적을 때
			document.getElementById('footer').style.position = 'fixed';
		} else {
			// 내용이 많을 때
			document.getElementById('footer').style.position = 'static';
		}
	}

	// 페이지 로드 시와 창 크기 변경 시에도 호출
	window.onload = adjustDocumentHeight;
	window.onresize = adjustDocumentHeight;
</script>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a906d923aeadc7ff14b2aa9616f0923&libraries=services"></script>
	<script>
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
			
			// db에 주소값 등록
			addAddress(getAddress);
		});

	
		var container = document.querySelector('.kakao-map-wrap'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.5540539, 126.9206153), //지도의 중심좌표.
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
				
				lat = 37.5540539, // 위도
				lon = 126.9206153; // 경도 
				locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				var message = '<div style="padding:5px; position:relative; bottom:3px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				/* navigator.geolocation.getCurrentPosition(function(position) {

							//lat = position.coords.latitude, // 위도
							//lon = position.coords.longitude; // 경도
							
							
							lat = 37.5540539, // 위도
							lon = 126.9206153; // 경도 

							//alert("위도: "+lat+" ,경도: "+lon);

							locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							var message = '<div style="padding:5px; position:relative; bottom:3px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);
						}); */
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

		/////////////////////// 슬라이더 //////////////////////////////
	
		let slideWrapper = $('.slider-wrap'), slides = slideWrapper.find('li'), currentIdx = 0,
        timer = undefined,
        pager = slideWrapper
				.find('.pager a');

		// 슬라이드 배치
		slides.each(function(idx) {
		  let leftValue = idx === 0 ? '0%' : '-100%';
		  $(this).css({
		    left: leftValue
		  });
		});
		

		// 페이저 슬라이드 작동시키기
		pager.click(function(e) {
			e.preventDefault();
			let idx = $(this).index();
			moveSlide(idx);
		});

		function moveSlide(i) {
			if (currentIdx === i)
				return;

			let currentSlide = slides.eq(currentIdx);
			let nextSlide = slides.eq(i);
			// 다음슬라이드 순간 left 100%, animate 0
			// 현재슬라이드 순간  animate -100%
			nextSlide.css({
				left : '100%'
			}).animate({
				left : '0%'
			});
			currentSlide.animate({left : '-100%'});

            currentIdx = i;

            // 모든페이저에서 active제거 현재 번호에 맞는 요소에 active추가
            pager.removeClass('active');
            pager.eq(currentIdx).addClass('active');
		}

        function autoSlide(){
            if(timer == undefined){
                timer = setInterval(() => {
                let ni = currentIdx +1;
                if(ni=== slides.length){
                    ni = 0;
                }
                moveSlide(ni);
            }, 3000);
            }       
        }
        autoSlide();
        slideWrapper.mouseenter(function(){
            clearInterval(timer);
            timer = undefined;
        })
        .mouseleave(function(){
            autoSlide();
        })
        
		
       /*/////////////도로명 //////////*/
           // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('doro');
	var element_wrap_w = document.getElementById('doro-back');
	var addr;
    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        var popupWindow = new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
               
               
                $("#doro-text").val(addr);
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                //document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap,{
            autoClose: false //기본값 true
        })
        // iframe을 넣은 element를 보이게 한다.
    }
    
 	// 도로명 모달 띄우기
	 $("#address").click(function() {
		$("#doro-back").fadeIn();
		sample3_execDaumPostcode();
	}); 

	// x버튼 누르면 모달 닫기
	 $("#doro-back").click(function() {
		$("#doro-back").fadeOut();
	}); 


	// '이 위치로 주소 설정' 버튼 누르면 모달 닫기
	$("#doro-add-but").click(function() {
		$("#doro-back").fadeOut();
		
		// db에 주소값 등록
		addAddress(addr);
	}); 
	
	
	
       
	
	//////////////////////////////////// 주소리스트 //////////////////////////////////////
	$(document).ready(function() {
    $(".down-arrow-icon").click(function(event) {
        event.stopPropagation(); // 화살표 클릭 시 이벤트 전파 방지
        $("#address-list").show();

		$.ajax({
					type: "get",
					url: "${path}/address",
					success: function(data){
						let result = addressListHTML(data);
						console.log(data);
						$("#address-list").html(result);
					},
					error: function(err){
						
					}
				});


    });

	function addressListHTML(data){
		let str="";
		data.forEach( ( item ) =>{

			if(item.addressStatus == 0){
				str+= `<div class="addressList-item" id="a`+ item.addressCode +`">
				<p  onclick="switchAddressStatus(`+item.addressCode+`, '`+item.deliveryAddress+`')" class="deliveryAddress">`+ item.deliveryAddress +`</p>
				<p  onclick="switchAddressStatus(`+item.addressCode+`, '`+item.deliveryAddress+`')" class="detailDeliveryAddress">`+ item.detailDeliveryAddress+`</p>
				<img onclick="deleteAddress(`+item.addressCode+`, `+item.addressStatus+`)" class="address-x-btn" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg==">
				</div>`
			}else if(item.addressStatus == 2){
				str+= `<div class="addressList-item" id="a`+ item.addressCode +`">
				<div class="home-address-item-wrap">
				<img class="address-home-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAAB9klEQVR4nO2YMUgcQRiFNyFEAiYmhRbapNNGUtkJh+SOnX1v2KsGrcTKOl3Ka20tba0CgSAByxDQQzAIqWzEJk1ClBSBcIUejozc6Xqse3dhb28O/gcPFpad+b+Zef/uXRCIuisMw9cAvjq762AUBWCJ5G+StuU/AFQwQnpE8j2AZgKi7SuSG7Va7XHgs5RSLwB8SgG4ZwC7JF8FPorkG5Kn3SASMD+01gsdY9g0FwmxCqDRK0QCxj2zmhjnHcmLwkGUUmMkN/sFSPG2MeaZG1NrvUjyZ2EgJGcAHOQA0fZRu0UrpSZJfhk4iNa6RPJXjhDto3YeRVHFzVEqlZ64Duc6XdGtNS+YppvDzdVatOVcCeI4fg7g46AAUoA+V6vVl7lCaK3nSB4XBcE7mJMoiuZzgSC5QvJf0RC8g2kAWPtvgETYrCfeMsY87QuiUqlMJdufR67HcTzdE0TaC8kzn2mt32ZCkFxP+0Tw0JfJFn0rY8w4gA8eFGj79E65XJ64BQHwrXXjrwfF2R59UyuAw+SRqpP8HobhrAcF2l7cqvUIwN5DObGj4KCbhl0gBaRDw15pyo50aNgrTdmRDg17penDjnQdvMi5KCCUHaEcrQxJRigZsZKRLElGKBmxkpEsSUYoGbGSkSwB2Pf9hxUe+ndRJApy1zULYoKtMzyokgAAAABJRU5ErkJggg==">
				<p  onclick="switchAddressStatus(`+item.addressCode+`, '`+item.deliveryAddress+`')" class="deliveryAddress">`+ item.deliveryAddress +`</p></div>
				<p  onclick="switchAddressStatus(`+item.addressCode+`, '`+item.deliveryAddress+`')" class="detailDeliveryAddress">`+ item.detailDeliveryAddress+`</p>
				</div>`
			}else{
				str+= `<div class="addressList-item" id="a`+ item.addressCode +`">
				<p class="deliveryAddress">`+ item.deliveryAddress +`</p>
				<p class="detailDeliveryAddress">`+ item.detailDeliveryAddress+`</p>
				</div>`
			}

		}); 
	 
		return str;
	}
    $(document).click(function(event) {
        let $myDiv = $("#address-list");
        let $arrow = $(".down-arrow-icon");
        if (!$(event.target).closest($myDiv).length && !$(event.target).is($arrow)) {
            $myDiv.hide();
        }
    });
});

	// 주소 삭제
	function deleteAddress(addressCode, addressStatus){

		if(addressStatus == 0){
			$.ajax({
	        type : "get",
	        url : "${path}/addressDelete",
	        data : "addressCode=" + addressCode,
	        dataType : "text",
	        success : function(data) {
	        $( '#a'+ addressCode).remove();

	        },
	        error : function(err) {
	            alert("삭제 요청에 실패했습니다.");
	        }
	    });

		}else{
			alert("배달지로 선택되어있는 주소는 삭제할 수 없습니다");
		}
	};

	// 주소상태(0,1) 변경
	function switchAddressStatus(addressCode, deliveryAddress){
		$.ajax({
	        type : "post",
	        url : "${path}/addressStatusSwitch",
	        data : {addressCode: addressCode},
	        dataType : "text",
	        success : function(data) {
				$("#address").html(deliveryAddress);
				let $myDiv = $("#address-list");
				$myDiv.hide();
	        },
	        error : function(err) {
	            alert("삭제 요청에 실패했습니다.");
	        }
	    });
	}
	
	// addAddress() 상세주소
	function addAddress(deliveryAddress){

		let detailDeliveryAddress = prompt("상세주소를 입력하세요");
		 
		if (detailDeliveryAddress != null) {
			$.ajax({
				type: "post",
				url: "${path}/addressAdd",
				data:  {
					deliveryAddress: deliveryAddress,
					detailDeliveryAddress: detailDeliveryAddress
				},
				dataType:"text",
				success: function(data){
					$("#address").html(deliveryAddress);
				},
				error: function(err){
			
				}
			});
		} 
	}



	</script>



</body>
</html>